<?php
/*
 * @package AJAX_Chat
 * @author Sebastian Tschan
 * @copyright (c) Sebastian Tschan
 * @license GNU Affero General Public License
 * @link https://blueimp.net/ajax/
 */

// Include custom libraries and initialization code here


define('MODE', 'CHAT');
define('ROOT_PATH', str_replace('\\', '/',dirname(AJAX_CHAT_PATH)).'/');
chdir(ROOT_PATH);
set_include_path(ROOT_PATH);
define('DATABASE_VERSION', 'OLD');

require 'includes/common.php';

$USER = Database::get()->selectSingle('SELECT * FROM %%USERS%% WHERE id = :id', array(':id' => $session->userId));
if (empty($USER) || (Config::get()->game_disable == 0 && $USER['authlevel'] == AUTH_USR)) {
    HTTP::redirectTo('../index.php?code=3');
}
$_SESSION['id'] = (int) $USER['id'];
if (!isModuleAvailable(MODULE_CHAT)) {
    die('Chat module is disabled.');
}
