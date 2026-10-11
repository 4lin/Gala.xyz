<?php
error_reporting(E_ALL);set_error_handler(function($n,$m){throw new Exception($m);});
define('STORAGE_FACTOR',1);
require __DIR__.'/../includes/classes/class.PlanetRessUpdate.php';
class Config { static $fixture;static function get($universe){return self::$fixture;} }
Config::$fixture=(object)array('metal_basic_income'=>36000,'crystal_basic_income'=>18000,'deuterium_basic_income'=>9000,'resource_multiplier'=>1,'energySpeed'=>1,'max_overflow'=>1);
$resource=array(113=>'energy_tech');$reslist=array('storage'=>array(),'prod'=>array(),'resstype'=>array(1=>array(901,902,903),2=>array(911)));$ProdGrid=array();
$user=array('universe'=>1,'urlaubs_modus'=>0,'energy_tech'=>1,'factor'=>array('ResourceStorage'=>0,'Energy'=>0));
$planet=array('planet_type'=>3,'last_update'=>100,'temp_max'=>0,'metal'=>10000000,'crystal'=>10000000,'deuterium'=>10000000,'metal_max'=>1e12,'crystal_max'=>1e12,'deuterium_max'=>1e12,'metal_perhour'=>1e10,'crystal_perhour'=>1e10,'deuterium_perhour'=>1e10);
$eco=new ResourceUpdate(false,false);list($u,$moon)=$eco->CalcResource($user,$planet,false,100);
foreach(array('metal','crystal','deuterium') as $r)if($moon[$r.'_perhour']!==0||$moon[$r]!==$planet[$r])throw new Exception('Moon production');
$eco->ReBuildCache();if(Config::$fixture->metal_basic_income!==36000)throw new Exception('Universe config changed');
$reflection=new ReflectionClass('ResourceUpdate');foreach(array('PLANET'=>array_merge($planet,array('planet_type'=>1,'metal_perhour'=>36000,'crystal_perhour'=>18000,'deuterium_perhour'=>9000)),'ProductionTime'=>10) as $key=>$value){$property=$reflection->getProperty($key);$property->setAccessible(true);$property->setValue($eco,$value);}
$method=$reflection->getMethod('ExecCalc');$method->setAccessible(true);$method->invoke($eco);list($u,$updated)=$eco->getData();if($updated['metal']!=10000200)throw new Exception('Planet production changed');
echo "PASS moon production zero; moon stock unchanged; shared configuration intact; planet produces expected resources\n";
