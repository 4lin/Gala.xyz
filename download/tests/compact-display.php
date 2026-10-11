<?php
require __DIR__.'/../includes/GeneralFunctions.php';
foreach(array(0=>'0',9999=>'9.999',10000=>'10',1000000=>'1',-1000000=>'-1',1000000000000=>'1',1e21=>'1') as $value=>$expected) {
 $text=display_number($value);
 if(strpos($text,$expected)===false)throw new Exception('Formatting failed');
 if(abs($value)>=10000 && (strpos($text,'title="'.pretty_number($value).'"')===false||strpos($text,'tabindex="0"')===false))throw new Exception('Exact value unavailable');
}
if(pretty_number(1234567)!=='1.234.567')throw new Exception('Exact formatter changed');
if(strpos(file_get_contents(__DIR__.'/../styles/templates/game/shared.information.gate.tpl'),'{$amount|number}')===false)throw new Exception('Gate Max changed');
if(strpos(file_get_contents(__DIR__.'/../styles/templates/game/page.fleetTable.default.tpl'),'{$FleetRow.count|number}')===false)throw new Exception('Fleet Max changed');
echo "PASS compact display, exact values, negative/large values and fleet/gate Max sources\n";
