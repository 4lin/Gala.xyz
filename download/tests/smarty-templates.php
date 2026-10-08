<?php
// Compile the real template tree and render the game's custom Smarty plugins.
error_reporting(E_ALL);
set_error_handler(function ($severity, $message, $file, $line) {
    if (error_reporting() & $severity) {
        throw new ErrorException($message, 0, $severity, $file, $line);
    }
});
$previousDirectory = getcwd();
chdir(dirname(__DIR__));
require 'includes/GeneralFunctions.php';
require 'includes/classes/class.template.php';
$temp = sys_get_temp_dir().'/gala-smarty-templates-'.uniqid();
mkdir($temp);
mkdir($temp.'/templates');
define('CACHE_PATH', $temp.'/');
$count = 0;
try {
    $smarty = new template();
    $smarty->setCaching(Smarty::CACHING_OFF);
    $iterator = new RecursiveIteratorIterator(new RecursiveDirectoryIterator('styles/templates'));
    foreach ($iterator as $file) {
        if (!$file->isFile() || substr($file->getFilename(), -4) !== '.tpl') continue;
        $path = str_replace('\\', '/', $file->getPathname());
        $tpl = $smarty->createTemplate(substr($path, strlen('styles/templates/')));
        $tpl->compileTemplateSource();
        $count++;
    }
    $LNG = array('short_day'=>'d', 'short_hour'=>'h', 'short_minute'=>'m', 'short_second'=>'s');
    $smarty->assign_vars(array('amount'=>12345, 'duration'=>3661, 'data'=>array('id'=>1)));
    $output = $smarty->fetch('string:{$amount|number}|{$duration|time}|{$data|json}|{pretty_fly_time($duration)}');
    if ($output !== '12.345|01h 01m 01s|{"id":1}|01:01:01') {
        throw new Exception('Game resource, duration or JSON formatting changed: '.$output);
    }
    unset($_GET['page']);
    if ($smarty->fetch("string:{\$smarty.get.page|default:'overview'|htmlspecialchars}") !== 'overview') {
        throw new Exception('Missing page parameter no longer uses the safe default');
    }
    $smarty->assign_vars(array('url'=>'/target?a=1&b=2', 'postFields'=>array('token'=>'<"&'),
        'LNG'=>array('fcm_info'=>'Information', 'redirectPostMessage'=>'Redirecting')));
    $post = $smarty->fetch('login/info.redirectPost.tpl');
    if (strpos($post, 'action="/target?a=1&amp;b=2"') === false ||
        strpos($post, 'value="&lt;&quot;&amp;"') === false || strpos($post, 'method="post"') === false) {
        throw new Exception('POST redirect fields were not rendered and escaped correctly');
    }
    $hallLabels = array();
    foreach (array('lm_topkb','tkb_top','tkb_gratz','tkb_platz','tkb_owners','tkb_datum','tkb_units','tkb_legende','tkb_gewinner','tkb_verlierer') as $key) $hallLabels[$key] = $key;
    $smarty->assign_vars(array('LNG'=>$hallLabels, 'sort'=>'DESC', 'order'=>'units', 'TopKBList'=>array(array(
        'time'=>3600, 'date'=>'07.10.2026 12:00:00', 'rid'=>'fixture', 'result'=>'a',
        'attacker'=>'<script>fixture</script>', 'defender'=>'Defender', 'units'=>1000))));
    $hall = $smarty->fetch('game/page.battleHall.default.tpl');
    if (strpos($hall, 'day0 week0') === false || strpos($hall, '&lt;script&gt;fixture&lt;/script&gt;') === false) {
        throw new Exception('Hall of Fame dates or participant escaping failed');
    }
    preg_match_all('/\$LNG\.([A-Za-z_0-9]+)/', file_get_contents('styles/templates/game/page.shipyard.default.tpl'), $shipyardKeys);
    $shipyardLabels = array();
    foreach ($shipyardKeys[1] as $key) $shipyardLabels[$key] = $key;
    $smarty->assign_vars(array('LNG'=>$shipyardLabels, 'mode'=>'fleet', 'planetname'=>'Fixture', 'elementList'=>array(),
        'serverTimestamp'=>1000, 'serverRequestTimestamp'=>1000, 'serverRenderTimestamp'=>1000,
        'dpath'=>'styles/theme/gow/', 'BuildList'=>array('Queue'=>array(array('Light Cargo',5,10,202),array('Light Fighter',3,10,204)))));
    $shipyard = $smarty->fetch('game/page.shipyard.default.tpl');
    if (strpos($shipyard, 'shipyard-visible-queue') === false ||
        strpos($shipyard, '<strong>5</strong> Light Cargo') !== false ||
        strpos($shipyard, '<strong>3</strong> Light Fighter') === false) {
        throw new Exception('Shipyard queue quantities are not visible');
    }
    echo "PASS: $count templates compiled; game plugins, safe defaults, POST, Hall of Fame and shipyard queue rendering verified\n";
} finally {
    foreach (glob($temp.'/*') as $file) { if (is_file($file)) unlink($file); }
    foreach (glob($temp.'/templates/*') as $file) { if (is_file($file)) unlink($file); }
    rmdir($temp.'/templates');
    rmdir($temp);
    chdir($previousDirectory);
    restore_error_handler();
}
