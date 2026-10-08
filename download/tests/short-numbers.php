<?php
require __DIR__.'/../includes/GeneralFunctions.php';
foreach (array(400000000=>'400&nbsp;M', 1000000000=>'1&nbsp;B', 1000000000000=>'1&nbsp;T', -1000000000=>'-1&nbsp;B') as $value=>$expected) {
    if (shortly_number($value, 0) !== $expected) {
        throw new Exception('Incorrect scale for '.$value);
    }
}
echo "PASS: million, billion, trillion, and negative resource scales\n";
