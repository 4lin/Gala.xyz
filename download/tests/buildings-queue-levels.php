<?php
require dirname(__DIR__).'/includes/classes/class.BuildFunctions.php';
$resource = array(4 => 'solar', 14 => 'robot', 44 => 'silo');
$planet = array('solar' => 7, 'robot' => 3, 'silo' => 0);
$queue = array(array(44,1,100,100,'build'),array(4,9,10,110,'build'),array(14,4,20,130,'build'),array(4,9,10,140,'build'),array(14,5,20,160,'build'));
$result = BuildFunctions::normalizeBuildingQueueLevels($queue, $planet);
if (array_column($result,1) !== array(1,8,4,9,5)) throw new Exception('Interleaved queue levels incorrect');
if (BuildFunctions::normalizeBuildingQueueLevels($result,$planet) !== $result) throw new Exception('Normalization not stable');
$queue = array(array(4,99,10,10,'destroy'),array(4,99,10,20,'build'),array(4,99,10,30,'build'));
if (array_column(BuildFunctions::normalizeBuildingQueueLevels($queue,$planet),1) !== array(7,7,8)) throw new Exception('Mixed destruction/build levels incorrect');
echo "PASS building queue levels\n";
