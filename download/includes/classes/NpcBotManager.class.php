<?php
/**
 * Adaptation of mimikri/2moons-bots (MIT, copyright 2024 mimikri).
 * See licenses/2moons-bots-MIT.txt. NPC growth is deposited on the home planet;
 * ordinary game combat handles losses. No synthetic attacks or human sessions.
 */
class NpcBotManager
{
    private $db;
    private $table;
    public function __construct() {
        $this->db = Database::get();
        $this->table = DB_PREFIX.'npc_bots';
    }
    public function installed() {
        return (bool)$this->db->selectSingle('SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME=:table', array(':table'=>$this->table));
    }
    public function install() {
        $this->db->nativeQuery('CREATE TABLE IF NOT EXISTS `'.$this->table.'` (
            owner_id INT UNSIGNED NOT NULL PRIMARY KEY,
            universe INT UNSIGNED NOT NULL,
            planet_id INT UNSIGNED NOT NULL,
            active TINYINT UNSIGNED NOT NULL DEFAULT 1,
            daily_budget INT UNSIGNED NOT NULL DEFAULT 100000,
            last_growth INT UNSIGNED NOT NULL,
            carry TEXT NOT NULL,
            KEY universe_active (universe, active)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8');
        $cron = $this->db->selectSingle('SELECT cronjobID FROM %%CRONJOBS%% WHERE class = :class', array(':class'=>'NpcBotsCronjob'));
        if (!$cron) {
            $this->db->insert('INSERT INTO %%CRONJOBS%% SET name = :name, class = :class, isActive = 1, min = :min, hours = :hours, dom = :dom, month = :month, dow = :dow, nextTime = :time', array(':name'=>'NPC bots', ':class'=>'NpcBotsCronjob', ':min'=>'*/5', ':hours'=>'*', ':dom'=>'*', ':month'=>'*', ':dow'=>'*', ':time'=>time()+300));
        }
    }
    public function ids() {
        if (!$this->installed()) return array();
        return array_map('intval', array_column($this->db->select('SELECT owner_id FROM `'.$this->table.'`'), 'owner_id'));
    }
    public function listing($universe) {
        if (!$this->installed()) return array();
        return $this->db->select('SELECT b.*, u.username, p.galaxy, p.system, p.planet FROM `'.$this->table.'` b INNER JOIN %%USERS%% u ON u.id=b.owner_id AND u.universe=b.universe INNER JOIN %%PLANETS%% p ON p.id=b.planet_id AND p.id_owner=b.owner_id AND p.universe=b.universe WHERE b.universe=:uni ORDER BY b.owner_id', array(':uni'=>(int)$universe));
    }
    public static function integer($value, $min, $max) {
        if (!is_scalar($value) || !preg_match('/^[0-9]+$/D', (string)$value) || $value < $min || $value > $max) throw new InvalidArgumentException('Invalid NPC setting');
        return (int)$value;
    }
    public function create($universe, $count, $budget, $galaxy, $system, $language) {
        $config = Config::get($universe);
        $count = self::integer($count, 1, 20);
        $budget = self::integer($budget, 10000, 10000000);
        $galaxy = self::integer($galaxy, 1, $config->max_galaxy);
        $system = self::integer($system, 1, $config->max_system);
        $existing = count($this->listing($universe));
        if ($existing+$count > 200) throw new InvalidArgumentException('NPC limit');
        // Preflight a bounded scan: avoid createPlayer's unbounded random search.
        $positions = array();
        for ($offset=0; $offset < $config->max_system && count($positions)<$count; $offset++) {
            $currentSystem = (($system-1+$offset)%$config->max_system)+1;
            for ($position=1; $position <= $config->max_planets && count($positions)<$count; $position++) {
                if (PlayerUtil::isPositionFree($universe, $galaxy, $currentSystem, $position)) $positions[]=array($currentSystem,$position);
            }
        }
        if (count($positions)<$count) throw new InvalidArgumentException('No free NPC positions');
        $this->install();
        $created=0;
        foreach ($positions as $coords) {
            $name='NPC '.strtoupper(bin2hex(random_bytes(5)));
            $player=PlayerUtil::createPlayer($universe,$name,PlayerUtil::cryptPassword(bin2hex(random_bytes(32))),strtolower(str_replace(' ','-',$name)).'@npc.invalid',$language,$galaxy,$coords[0],$coords[1],$name,AUTH_USR,'127.0.0.1');
            // Disable inactivity mail; the cronjob cleaner explicitly preserves NPCs.
            $this->db->update('UPDATE %%USERS%% SET inactive_mail=1 WHERE id=:id',array(':id'=>$player[0]));
            $this->db->insert('INSERT INTO `'.$this->table.'` SET owner_id=:owner, universe=:uni, planet_id=:planet, daily_budget=:budget, last_growth=:time, carry=:carry',array(':owner'=>$player[0],':uni'=>$universe,':planet'=>$player[1],':budget'=>$budget,':time'=>time(),':carry'=>'{}'));
            $created++;
        }
        return $created;
    }
    public function configure($universe,$id,$active,$budget) {
        $id=self::integer($id,1,2147483647);
        $active=self::integer($active,0,1);
        $budget=self::integer($budget,10000,10000000);
        // Reset the clock: resuming does not award resources for paused time.
        $this->db->update('UPDATE `'.$this->table.'` SET active=:active,daily_budget=:budget,last_growth=:time WHERE owner_id=:id AND universe=:uni',array(':active'=>$active,':budget'=>$budget,':time'=>time(),':id'=>$id,':uni'=>$universe));
    }
    public static function growth($budget,$seconds,$carry,array $shipCosts) {
        // Original module allocation: 10% resources, 90% fleet, split equally.
        $seconds=max(0,min(86400,(int)$seconds));
        $budget=self::integer($budget,10000,10000000);
        $carry=is_array($carry)?$carry:array();
        $rates=array('metal'=>0.05,'crystal'=>0.03,'deuterium'=>0.02);
        foreach($shipCosts as $name=>$cost) {
            if (!preg_match('/^[a-z_]+$/D',$name) || !is_numeric($cost) || $cost<=0) throw new InvalidArgumentException('Invalid NPC ship');
            $rates[$name]=0.9/count($shipCosts)/$cost;
        }
        $result=array('amounts'=>array(),'carry'=>array());
        foreach($rates as $key=>$rate) {
            $remainder=isset($carry[$key])&&is_numeric($carry[$key])?max(0,min(0.999999999,(float)$carry[$key])):0;
            $value=$budget*$seconds/86400*$rate+$remainder;
            $amount=(int)floor($value+1e-10);
            $result['amounts'][$key]=$amount;
            $result['carry'][$key]=max(0,$value-$amount);
        }
        return $result;
    }
    public function tick($now=null,$universe=null) {
        if (!$this->installed()) return 0;
        $now=$now===null?time():(int)$now;
        global $resource,$pricelist;
        if (!isset($resource,$pricelist)) require 'includes/vars.php';
        $costs=array();
        foreach(array(205,207,213) as $id) {
            if (!isset($resource[$id],$pricelist[$id]['cost'])) throw new RuntimeException('NPC ship definitions unavailable');
            $cost=0;
            foreach(array(901,902,903) as $material) $cost+=isset($pricelist[$id]['cost'][$material])?$pricelist[$id]['cost'][$material]:0;
            $costs[$resource[$id]]=$cost;
        }
        $query='SELECT * FROM `'.$this->table.'` WHERE active=1 AND last_growth<:now';
        $params=array(':now'=>$now);
        if ($universe!==null) { $query.=' AND universe=:uni'; $params[':uni']=(int)$universe; }
        $processed=0;
        foreach($this->db->select($query,$params) as $bot) {
            $growth=self::growth($bot['daily_budget'],$now-$bot['last_growth'],json_decode($bot['carry'],true),$costs);
            $sets=array('b.last_growth=:now','b.carry=:carry','u.onlinetime=:online');
            $args=array(':now'=>$now,':carry'=>json_encode($growth['carry']),':online'=>$now,':id'=>$bot['owner_id'],':uni'=>$bot['universe'],':old'=>$bot['last_growth']);
            foreach($growth['amounts'] as $column=>$amount) {
                $sets[]='p.`'.$column.'`=p.`'.$column.'`+:growth_'.$column;
                $args[':growth_'.$column]=$amount;
            }
            // One multi-table statement locks the planet and NPC together, including
            // legacy MyISAM planets. The timestamp predicate prevents duplicate payouts.
            $this->db->update('UPDATE `'.$this->table.'` b INNER JOIN %%PLANETS%% p ON p.id=b.planet_id AND p.id_owner=b.owner_id AND p.universe=b.universe AND p.planet_type=1 INNER JOIN %%USERS%% u ON u.id=b.owner_id AND u.universe=b.universe SET '.implode(',',$sets).' WHERE b.owner_id=:id AND b.universe=:uni AND b.active=1 AND b.last_growth=:old',$args);
            if ($this->db->rowCount()>0) $processed++;
        }
        return $processed;
    }
}
