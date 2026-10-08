<?php
// Exercise empty-target validation and dispatch without changing a real database.
set_error_handler(function ($severity, $message, $file, $line) {
    throw new ErrorException($message, 0, $severity, $file, $line);
});
require __DIR__.'/../includes/classes/HTTP.class.php';
class FleetJsonResult extends Exception {}
class AbstractGamePage {
    public function __construct() {}
    protected function sendJSON($value) { throw new FleetJsonResult($value); }
}
class Config {
    public static function get() { return (object) array('max_planets'=>15); }
}
class Universe { public static function current() { return 1; } }
class Database {
    public static $queries = array();
    public static function get() { return new self(); }
    public function selectSingle($sql, $params) { return false; }
    public function update($sql, $params) { self::$queries[] = array($sql, $params); }
    public function insert($sql, $params) { self::$queries[] = array($sql, $params); }
    public function lastInsertId() { return 42; }
}
function floatToString($value) { return (string) $value; }
define('TIMESTAMP', 1000);
define('MODULE_FLEET_TABLE', 1);
foreach (array('EXPEDITION', 'COLONY', 'TRANSPORT', 'SPY', 'ATTACK', 'HOLD', 'STATION', 'ACS', 'DESTROY', 'DARKMATTER') as $module) {
    define('MODULE_MISSION_'.$module, $module);
}
function isModuleAvailable($module) { return true; }
require __DIR__.'/../includes/pages/game/ShowFleetStep1Page.class.php';
require __DIR__.'/../includes/classes/class.FleetFunctions.php';
$PLANET = array('galaxy'=>1, 'system'=>1, 'planet'=>2, 'planet_type'=>1);
$USER = array('id'=>1);
$LNG = array('fl_error_no_moon'=>'NO_MOON', 'fl_error_empty_derbis'=>'NO_DEBRIS');
foreach (array(1=>'OK', 2=>'NO_DEBRIS', 3=>'NO_MOON') as $type=>$expected) {
    $_GET = $_REQUEST = array('galaxy'=>1, 'system'=>1, 'planet'=>3, 'planet_type'=>$type);
    try {
        (new ShowFleetStep1Page())->checkTarget();
        throw new Exception('Expected a JSON response');
    } catch (FleetJsonResult $result) {
        if ($result->getMessage() !== $expected) { throw new Exception('Incorrect empty-target response'); }
    }
}
$resource = array(208=>'colonizer', 202=>'small_ship_cargo');
$USER['universe'] = 1;
$missionInfo = array('planet'=>3, 'planettype'=>1, 'Ship'=>array(208=>1), 'IsAKS'=>0);
if (FleetFunctions::GetAvailableMissions($USER, $missionInfo, false) !== array(7) ||
    in_array(7, FleetFunctions::GetAvailableMissions($USER, $missionInfo, array('id_owner'=>2)))) {
    throw new Exception('Colonization must require an empty target');
}
$missionInfo['Ship'] = array(202=>1);
if (FleetFunctions::GetAvailableMissions($USER, $missionInfo, false) !== array()) {
    throw new Exception('Colonization must require a colony ship');
}
FleetFunctions::sendFleet(array(208=>1, 202=>2), 7, 1, 10, 1, 1, 2, 1,
    0, 0, 1, 1, 3, 1, array(901=>0, 902=>0, 903=>0), 1100, 1100, 1200);
if (count(Database::$queries) !== 4 ||
    Database::$queries[0][1][':colonizer'] !== '1' ||
    Database::$queries[0][1][':small_ship_cargo'] !== '2' ||
    Database::$queries[1][1][':fleetTargetPlanetID'] !== 0 ||
    Database::$queries[1][1][':fleetMission'] !== 7) {
    throw new Exception('Colonization dispatch did not preserve ships or empty target');
}
echo "PASS: empty colony target accepted; absent moon/debris rejected; fleet dispatch recorded\n";
