<?php
// Isolated regression: no database, session, purchases or live queue updates.
define('MODULE_BUILDING', 1);
class AbstractGamePage {}
class AbstractPage {}
class BuildFunctions {
    public static function getBuildingTime($user, $planet, $id, $price = null, $destroy = false, $level = null) {
        return $level * ($destroy ? 5 : 10);
    }
}
require dirname(__DIR__).'/includes/pages/game/'.$argv[1];
$page = (new ReflectionClass('ShowBuildingsPage'))->newInstanceWithoutConstructor();
$remove = new ReflectionMethod('ShowBuildingsPage', 'RemoveBuildingFromQueue');
$remove->setAccessible(true);
$USER = array();
function check($condition, $message) {
    if (!$condition) throw new Exception($message);
}
$initial = array(array(1, 1, 10, 100, 'build'), array(2, 1, 10, 110, 'build'), array(3, 1, 10, 120, 'build'), array(2, 2, 20, 140, 'build'));
foreach (array(2, 3, 4) as $position) {
    $PLANET = array('b_building_id' => serialize($initial), 'b_building' => 100);
    check($remove->invoke($page, $position) === true, 'Removal failed');
    $result = unserialize($PLANET['b_building_id']);
    $expected = $initial; array_splice($expected, $position - 1, 1);
    check(array_column($result, 0) === array_column($expected, 0), 'Unselected order disappeared');
    check($result[0] === $initial[0] && $PLANET['b_building'] === 100, 'Active construction changed');
    for ($i = 1; $i < count($result); $i++) {
        check($result[$i][3] === $result[$i-1][3] + $result[$i][2], 'End time inconsistent');
    }
    if ($position === 2) check($result[2][1] === 1 && $result[2][2] === 10, 'Repeated level not recalculated');
}
$initial[2][4] = 'destroy';
$PLANET = array('b_building_id' => serialize($initial));
$remove->invoke($page, 2);
$result = unserialize($PLANET['b_building_id']);
check($result[1][2] === 5, 'Destruction duration ignored');
$before = $PLANET;
foreach (array(0, 1, 4, 99) as $position) {
    check($remove->invoke($page, $position) === false && $PLANET === $before, 'Invalid position modified queue');
}
echo 'PASS '.$argv[1].PHP_EOL;
