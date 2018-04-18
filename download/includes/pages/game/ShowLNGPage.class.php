<?php

class ShowLNGPage extends AbstractGamePage
{
	public static $requireModule = 0;
	function __construct()
	{
parent::__construct();
$this->setWindow('ajax');
	}
function forec($mmm, $show){
  foreach($mmm as $key => $subarray){
    if (is_array($subarray)){
      self::forec($subarray , $key);
    }else{
      $thediff[$show][$key] = $subarray;

    }
  }
}
function show()
{
global $thediff;
$deflang = HTTP::_GP('language', 'en');
$deflang1 = HTTP::_GP('one', 'es');
$thediff = array();
    foreach (glob("language/" . $deflang1 . "/*.php") as $filename) // replace default lang here
    {
      include $filename;
    }
    $LNGde = $LNG;
    $LNG = array();
    foreach (glob("language/" . $deflang . "/*.php") as $filename)
    {
        include $filename;
    }
    // Compare all values by a json_encode
    $diff = array_diff_key(array_map('json_encode', $LNGde), array_map('json_encode', $LNG));
    // Json decode the result
    $diff = array_map('json_decode', $diff);
foreach($LNGde as $key => $subarray){
  if (is_array($subarray)){
    if(isset($LNG[$key])){
    $diff[$key] = array_diff_key($LNGde[$key] , $LNG[$key]);
    }else{
      $diff[$key] = $subarray;
    }

  }
}
echo '<pre><code>';

foreach($diff as $key => $value){
  if(is_array($value)){
foreach($value as $key2 => $value2){
  echo htmlspecialchars('$LNG[\'' . $key . '\'][\'' . $key2 . '\'] = \'' . $value2 . '\';
  ');
}
  }else{
    echo htmlspecialchars('$LNG[\'' . $key . '\'] = \'' . $value . '\';
    ');
  }

}
    //$result = array_diff(array_keys($LNGde), array_keys($LNG));
    //var_export($diff);
    echo '</code></pre>';
	//echo
	}
}
