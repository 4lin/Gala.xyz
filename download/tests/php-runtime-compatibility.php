<?php
// Exercise shared runtime primitives with deprecations treated as failures.
error_reporting(E_ALL);
require __DIR__.'/../includes/GeneralFunctions.php';
set_error_handler('errorHandler');
require __DIR__.'/../includes/classes/HTTP.class.php';
require __DIR__.'/../includes/classes/Language.class.php';
require __DIR__.'/../includes/classes/Session.class.php';
require __DIR__.'/../includes/classes/class.PlanetRessUpdate.php';

$language = (new ReflectionClass('Language'))->newInstanceWithoutConstructor();
$language['example'] = 'Example';
if (!isset($language['example']) || $language['example'] !== 'Example' ||
    $language['missing'] !== 'missing') {
    throw new Exception('Language ArrayAccess behavior changed');
}
unset($language['example']);
if (isset($language['example'])) {
    throw new Exception('Language offset removal failed');
}
$resources = new ResourceUpdate(false, true);
if ($resources->Build !== false || $resources->Tech !== true) {
    throw new Exception('Resource update flags changed');
}

$temp = sys_get_temp_dir().'/gala-php-runtime-'.uniqid();
mkdir($temp);
mkdir($temp.'/sessions');
define('ROOT_PATH', dirname(__DIR__).'/');
define('CACHE_PATH', $temp.'/');
define('MODE', 'LOGIN');
define('HTTP_ROOT', '/');
define('SESSION_LIFETIME', 3600);
define('HTTPS', false);
define('PROTOCOL', 'http://');
define('HTTP_HOST', '127.0.0.1');
define('TIMESTAMP', time());
$_SERVER['REQUEST_URI'] = '/runtime-test';
$previousDirectory = getcwd();
$previousSessionName = session_name();
try {
    Session::init();
    if (session_get_cookie_params()['domain'] !== '') {
        throw new Exception('Session cookie domain changed');
    }
    // Early bootstrap errors must remain visible even before Config is loaded.
    chdir($temp);
    ob_start();
    exceptionHandler(new ErrorException('Runtime compatibility fixture'));
    $html = ob_get_clean();
    if (strpos($html, 'Runtime compatibility fixture') === false) {
        throw new Exception('The exception renderer lost the original error');
    }
} finally {
    chdir($previousDirectory);
    session_name($previousSessionName);
    restore_error_handler();
    rmdir($temp.'/sessions');
    rmdir($temp);
}
echo "PASS: language access, resource flags, session cookies and early error reporting\n";
