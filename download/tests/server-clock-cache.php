<?php
// Run the controller's clock assignment through Smarty's real output cache.
error_reporting(E_ALL);
set_error_handler(function ($severity, $message, $file, $line) {
    if (error_reporting() & $severity) {
        throw new ErrorException($message, 0, $severity, $file, $line);
    }
});
require __DIR__.'/../includes/libs/Smarty/Smarty.class.php';
$source = file_get_contents(__DIR__.'/../includes/pages/game/AbstractGamePage.class.php');
if (!preg_match('/\$this->assign\(array\(\s*\x27serverRequestTimestamp\x27[\s\S]*?\)\)(?:, false)?;/', $source, $match)) {
    throw new Exception('Missing clock assignment');
}
define('REQUEST_TIMESTAMP', microtime(true));
$fixture = new class {
    public $smarty;
    public function assign($values, $nocache = true) {
        $this->smarty->assign($values, null, $nocache);
    }
    public function sample($code) { eval($code); }
};
$temp = sys_get_temp_dir().'/gala-clock-cache-'.uniqid();
mkdir($temp);
$fixture->smarty = new Smarty();
$fixture->smarty->setCompileDir($temp);
$fixture->smarty->setCacheDir($temp);
$fixture->smarty->caching = Smarty::CACHING_LIFETIME_CURRENT;
$template = 'string:{$serverRequestTimestamp}|{$serverRenderTimestamp}|{$cachedMarker}';
try {
    $fixture->sample($match[0]);
    $fixture->smarty->assign('cachedMarker', 'first');
    $first = explode('|', $fixture->smarty->fetch($template, 'clock'));
    usleep(20000);
    $fixture->sample($match[0]);
    $fixture->smarty->assign('cachedMarker', 'second');
    $second = explode('|', $fixture->smarty->fetch($template, 'clock'));
    if ($second[2] !== 'first') throw new Exception('Output cache was not reused');
    if ((float)$second[1] <= (float)$first[1]) throw new Exception('Render timestamp was cached');
    if (!$fixture->smarty->getTemplateVars('serverRequestTimestamp') ||
        !$fixture->smarty->tpl_vars['serverRequestTimestamp']->nocache) {
        throw new Exception('Request timestamp is cacheable');
    }
    echo "PASS: cached output retains content but refreshes precise clock samples\n";
} finally {
    foreach (glob($temp.'/*') as $file) unlink($file);
    rmdir($temp);
}
