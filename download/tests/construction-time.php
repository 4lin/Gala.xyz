<?php
// Isolated regression tests: all game state and database responses stay in memory.
error_reporting(E_ALL);
set_error_handler(function ($severity, $message, $file, $line) { throw new Exception($message.' at '.$file.':'.$line); });
define('MODULE_BUILDING', 1);
define('MODULE_RESEARCH', 1);
define('TIMESTAMP', 1000);
class Config {
    public static $value;
    public static function get($universe = null) { return self::$value; }
}
class Database {
    public static $planets = array();
    public static function get() { return new self(); }
    public function selectSingle($sql, $params) { return self::$planets[$params[':id']]; }
    public function update() { throw new Exception('Unexpected database write'); }
}
function CalculateMaxPlanetFields($planet) { return 1000; }
require dirname(__DIR__).'/includes/classes/class.BuildFunctions.php';
require dirname(__DIR__).'/includes/classes/class.PlanetRessUpdate.php';
require dirname(__DIR__).'/includes/pages/game/AbstractGamePage.class.php';
require dirname(__DIR__).'/includes/pages/game/ShowBuildingsPage.class.php';
require dirname(__DIR__).'/includes/pages/game/ShowResearchPage.class.php';
Config::$value = (object) array('game_speed'=>2500, 'min_build_time'=>1, 'factor_university'=>8,
    'max_elements_build'=>5, 'max_elements_tech'=>5);
$resource = array(1=>'mine',2=>'crystal_mine',3=>'deut_mine',6=>'uni',14=>'robot',15=>'nano',21=>'yard',31=>'lab',
    106=>'spy',108=>'computer',109=>'weapons',123=>'network',202=>'cargo',901=>'metal',902=>'crystal',903=>'deuterium',921=>'dm');
$reslist = array('build'=>array(1,2,3,6,14,15,21,31),'tech'=>array(106,108,109),'fleet'=>array(202),'defense'=>array(),
    'missile'=>array(),'ressources'=>array(901,902),'allow'=>array(1=>array(1,2,3,6,14,15,21,31)));
$pricelist = array();
foreach (array_merge($reslist['build'],$reslist['tech'],$reslist['fleet']) as $id) {
    $pricelist[$id] = array('factor'=>$id===202?1:2,'max'=>255,'cost'=>array(901=>100,902=>50));
}
$requeriments = array();
function fixture() {
    global $resource;
    $planet = array('id'=>1,'planet_type'=>1,'field_current'=>0,'b_building'=>0,'b_building_id'=>'','b_hangar_id'=>'');
    foreach ($resource as $name) $planet[$name]=0;
    $planet['mine']=7; $planet['lab']=1; $planet['lab_inter']=array(1);
    $planet['metal']=$planet['crystal']=$planet['deuterium']=100000000;
    $user = array('id'=>1,'universe'=>1,'hof'=>0,'spy'=>3,'computer'=>0,'weapons'=>0,'network'=>0,'dm'=>0,
        'b_tech'=>0,'b_tech_id'=>0,'b_tech_planet'=>0,'b_tech_queue'=>'',
        'factor'=>array('BuildTime'=>0,'ResearchTime'=>0,'ShipTime'=>0,'DefensiveTime'=>0));
    // Research belongs to the user, never to the planet.
    unset($planet['spy'],$planet['computer'],$planet['weapons'],$planet['network'],$planet['dm']);
    return array($user,$planet);
}
function check($condition,$message) { if (!$condition) throw new Exception($message); }
function invoke($page,$method,$args=array()) {
    $reflection=new ReflectionMethod(get_class($page),$method);$reflection->setAccessible(true);
    return $reflection->invokeArgs($page,$args);
}
function page($class) {
    $page=(new ReflectionClass($class))->newInstanceWithoutConstructor();
    $property=new ReflectionProperty('AbstractGamePage','ecoObj');$property->setAccessible(true);
    $property->setValue($page,new ResourceUpdate());
    return $page;
}
function chain($queue,$from,$base) {
    for($i=$from;$i<count($queue);$i++) { check($queue[$i][3]===$base+$queue[$i][2],'Broken deadline chain');$base=$queue[$i][3]; }
}
list($USER,$PLANET)=fixture();
check(BuildFunctions::getElementPrice($USER,$PLANET,1)===BuildFunctions::getElementPrice($USER,$PLANET,1,false,8),'Normal building cost changed');
check(BuildFunctions::getElementPrice($USER,$PLANET,1,false,9)[901]===2*BuildFunctions::getElementPrice($USER,$PLANET,1,false,8)[901],'Target level ignored');
check(BuildFunctions::getElementPrice($USER,$PLANET,106)===BuildFunctions::getElementPrice($USER,$PLANET,106,false,4),'Normal research cost changed');
check(BuildFunctions::getBuildingTime($USER,$PLANET,106,null,false,5)===2*BuildFunctions::getBuildingTime($USER,$PLANET,106,null,false,4),'Research time does not grow with target');
check(BuildFunctions::getElementPrice($USER,$PLANET,202,false,3)[901]===300,'Ship quantity semantics changed');
$expected=BuildFunctions::getBuildingTime($USER,$PLANET,1,null,true,7);
check($expected===4992.0,'Demolition formula changed');
$build=page('ShowBuildingsPage');
invoke($build,'AddBuildingToQueue',array(1,false));
$queue=unserialize($PLANET['b_building_id']);
check($queue[0][2]===$expected && $PLANET['b_building']===TIMESTAMP+$expected,'Initial demolition uses construction duration');
list($USER,$PLANET)=fixture();
$PLANET['b_building']=TIMESTAMP;$PLANET['b_building_id']=serialize(array(array(1,7,1,1,'destroy')));
$eco=new ResourceUpdate();$eco->setData($USER,$PLANET);$eco->SetNextQueueElementOnTop();list($USER,$PLANET)=$eco->getData();
check(unserialize($PLANET['b_building_id'])[0][2]===$expected,'Promoted demolition duration wrong');
list($USER,$PLANET)=fixture();
$initial=array(array(106,4,2160,3160,1),array(108,1,270,3430,1),array(109,1,270,3700,1),array(108,2,540,4240,1));
$USER['b_tech']=3160;$USER['b_tech_id']=106;$USER['b_tech_planet']=1;
$research=page('ShowResearchPage');
foreach(array(2,3,4) as $position) {
    $USER['b_tech_queue']=serialize($initial);
    check(invoke($research,'RemoveBuildingFromQueue',array($position))===true,'Research removal failed');
    $queue=unserialize($USER['b_tech_queue']);$expectedQueue=$initial;array_splice($expectedQueue,$position-1,1);
    check(array_column($queue,0)===array_column($expectedQueue,0),'Unselected research removed');
    check($queue[0]===$initial[0] && $USER['b_tech']===3160,'Active research changed');
    chain($queue,$position-1,$queue[$position-2][3]);
    if($position===2) check($queue[2][1]===1 && $queue[2][2]===270.0,'Repeated research target/duration not reduced');
}
$before=$USER;
foreach(array(0,1,99) as $position) check(invoke($research,'RemoveBuildingFromQueue',array($position))===false && $USER===$before,'Invalid removal changed research');
// Building removal recalculates the remaining repeated level and its real duration.
list($USER,$PLANET)=fixture();
$PLANET['b_building']=2000;
$PLANET['b_building_id']=serialize(array(array(1,8,1000,2000,'build'),array(1,9,2000,4000,'build'),array(1,10,4000,8000,'build')));
invoke($build,'RemoveBuildingFromQueue',array(2));$queue=unserialize($PLANET['b_building_id']);
check(count($queue)===2 && $queue[0][3]===2000 && $queue[1][1]===9,'Building removal changed the active order or wrong level');
check($queue[1][2]===BuildFunctions::getBuildingTime($USER,$PLANET,1,null,false,9),'Building removal used current-level duration');
chain($queue,1,2000);
// Removing the active order retains and renumbers repeated research.
list($USER,$PLANET)=fixture();
$USER['b_tech']=3160;$USER['b_tech_id']=106;$USER['b_tech_planet']=1;
$USER['b_tech_queue']=serialize(array(array(106,4,2160,3160,1),array(106,5,4320,7480,1),array(108,1,270,7750,1)));
invoke($research,'CancelBuildingFromQueue');$queue=unserialize($USER['b_tech_queue']);
check(array_column($queue,0)===array(106,108) && $queue[0][1]===4 && $queue[0][2]===2160.0,'Active cancellation lost repeated research');
chain($queue,0,TIMESTAMP);check($USER['b_tech']===$queue[0][3],'New research deadline wrong');
// Recalculation uses each queued planet's laboratory, without a real database.
list($USER,$PLANET)=fixture();$remote=$PLANET;$remote['id']=2;$remote['lab']=3;Database::$planets[2]=$remote;
$queue=invoke($research,'recalculateResearchQueue',array(array(array(106,4,0,0,2)),TIMESTAMP));
check($queue[0][2]===1080.0 && $queue[0][3]===2080.0,'Remote laboratory ignored');
// Building cancellation preserves repeated targets and uses demolition timing.
list($USER,$PLANET)=fixture();$PLANET['b_building']=3000;
$PLANET['b_building_id']=serialize(array(array(1,8,2000,3000,'build'),array(1,9,4000,7000,'build'),array(1,9,1000,8000,'destroy')));
invoke($build,'CancelBuildingFromQueue');$queue=unserialize($PLANET['b_building_id']);
check(array_column($queue,1)===array(8,8),'Building cancellation levels wrong');chain($queue,0,TIMESTAMP);
check($queue[1][2]===BuildFunctions::getBuildingTime($USER,$PLANET,1,null,true,8),'Queued demolition recalculation wrong');
echo "PASS: target-level costs, research removal/cancellation, remote labs, demolition start/promotion, chained deadlines\n";
