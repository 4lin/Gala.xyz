<?php
// Exercise the real purchase method with isolated planet data.
class AbstractGamePage {}
class Config { public static function get() { return (object) array('max_fleet_per_build'=>1000000); } }
class BuildFunctions {
    public static function isTechnologieAccessible($user, $planet, $id) { return true; }
    public static function getMaxConstructibleElements($user, $planet, $id) { return floor($planet['metal']/10); }
    public static function getElementPrice($user, $planet, $id, $destroy, $count) { return array(901=>10*$count); }
}
require __DIR__.'/../includes/pages/game/ShowShipyardPage.class.php';
$resource = array(502=>'interceptor', 503=>'missile', 901=>'metal');
$reslist = array('fleet'=>array(202,204), 'defense'=>array(), 'missile'=>array(), 'one'=>array());
$USER = array();
$PLANET = array('metal'=>1000, 'interceptor'=>0, 'missile'=>0, 'b_hangar_id'=>serialize(array(array(202,5))));
$page = (new ReflectionClass('ShowShipyardPage'))->newInstanceWithoutConstructor();
$method = new ReflectionMethod('ShowShipyardPage','BuildAuftr');
$method->setAccessible(true);
$method->invoke($page,array(204=>3));
if (unserialize($PLANET['b_hangar_id']) != array(array(202,5),array(204,3)) || $PLANET['metal'] != 970) {
    throw new Exception('Existing production blocked or corrupted the next order');
}
echo "PASS: second ship order appended while the first is still active; cost deducted once\n";
