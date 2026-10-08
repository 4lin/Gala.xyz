<?php
// Exercise the real admin controller with isolated configuration and request data.
require __DIR__.'/../includes/classes/HTTP.class.php';
function allowedTo($page) { return true; }
function get_timezone_selector() { return array(); }
class Universe { public static function getEmulated() { return 1; } }
class Config {
    public static $value;
    public static function get($universe) { return self::$value; }
}
class AdminConfigFixture {
    public $values = array('dst'=>2, 'close_reason'=>'Existing closure message');
    public $saves = 0;
    public function __get($key) { return isset($this->values[$key]) ? $this->values[$key] : ''; }
    public function __set($key, $value) { $this->values[$key] = $value; }
    public function save() { $this->saves++; }
}
class Log {
    public $target, $old, $new;
    public function __construct($type) {}
    public function save() {}
}
class template {
    public function assign_vars($values) {}
    public function show($file) {}
}
$LNG = array('se_mail_sel'=>array(), 'se_smtp_ssl_1'=>'', 'se_smtp_ssl_2'=>'', 'se_smtp_ssl_3'=>'');
require __DIR__.'/../includes/pages/adm/ShowConfigBasicPage.php';
Config::$value = new AdminConfigFixture();
$_POST = $_REQUEST = array('game_name'=>'Migration test');
ShowConfigBasicPage();
if (Config::$value->dst !== 2 || Config::$value->close_reason !== 'Existing closure message' ||
    Config::$value->game_name !== 'Migration test' || Config::$value->saves !== 1) {
    throw new Exception('Saving an unrelated field reset omitted settings');
}
$_POST = $_REQUEST = array('game_name'=>'Migration test', 'dst'=>'0', 'close_reason'=>'');
ShowConfigBasicPage();
if (Config::$value->dst !== 0 || Config::$value->close_reason !== '') {
    throw new Exception('Explicit settings were not accepted');
}
echo "PASS: omitted admin settings preserved; explicit changes saved\n";
