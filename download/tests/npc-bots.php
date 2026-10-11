<?php
require dirname(__DIR__).'/includes/classes/NpcBotManager.class.php';
function npcCheck($ok,$label){if(!$ok)throw new Exception($label);}
$costs=array('heavy_hunter'=>10000,'battle_ship'=>60000,'destructor'=>125000);
$day=NpcBotManager::growth(100000,86400,array(),$costs);
npcCheck($day['amounts']['metal']===5000 && $day['amounts']['crystal']===3000 && $day['amounts']['deuterium']===2000,'Resource allocation');
npcCheck($day['amounts']['heavy_hunter']===3,'Ship growth');
$carry=array();$totals=array();for($i=0;$i<288;$i++){$g=NpcBotManager::growth(100000,300,$carry,$costs);$carry=$g['carry'];foreach($g['amounts'] as $key=>$value)$totals[$key]=isset($totals[$key])?$totals[$key]+$value:$value;}
npcCheck($totals===$day['amounts'],'Fractional growth lost across cron ticks');
npcCheck(NpcBotManager::growth(100000,2592000,array(),$costs)===$day,'Downtime payout was not capped');
foreach(NpcBotManager::growth(100000,-1,array(),$costs)['amounts'] as $value)npcCheck($value===0,'Negative elapsed payout');
foreach(array('1 OR 1=1',array(1),'-1','0','21') as $value){$rejected=false;try{NpcBotManager::integer($value,1,20);}catch(InvalidArgumentException $e){$rejected=true;}npcCheck($rejected,'Invalid count accepted');}
$rejected=false;try{NpcBotManager::growth(100000,300,array(),array('bad`sql'=>0));}catch(InvalidArgumentException $e){$rejected=true;}npcCheck($rejected,'Unsafe ship definition accepted');
echo "PASS: NPC resource/fleet allocation, fractional carry, downtime cap and input validation.\n";
