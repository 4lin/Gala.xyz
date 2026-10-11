<?php
/**
 *  2Moons 
 *   by Jan-Otto Kröpke 2009-2016
 *
 * For the full copyright and license information, please view the LICENSE
 *
 * @package 2Moons
 * @author Jan-Otto Kröpke <slaver7@gmail.com>
 * @copyright 2009 Lucky
 * @copyright 2016 Jan-Otto Kröpke <slaver7@gmail.com>
 * @licence MIT
 * @version 1.8.0
 * @link https://github.com/jkroepke/2Moons
 */

// Translated into English by QwataKayean . All rights reversed (C) 2012
// 2Moons - Copyright (C) 2010-2012 Slaver


$LNG['back'] = 'Back';
$LNG['continue']				= 'Continue';
$LNG['continueUpgrade'] = 'Continue upgrade';
$LNG['login'] = 'Log in';

$LNG['menu_intro']				= 'Introduction';
$LNG['menu_install']			= 'Installation';
$LNG['menu_license']			= 'License';
$LNG['menu_upgrade'] = 'Upgrade';

$LNG['title_install']			= 'Installation';

$LNG['intro_lang']				= 'Language';
$LNG['intro_install'] = 'Start installation';
$LNG['intro_welcome']			= 'Hello user of 2Moons!';
$LNG['intro_text']				= 'The 2Moons is one of the best projects of OGame.<br>The 2Moons is the newest and most stable of XNova currently developed. 2Moons is remarkable for its ease of stability, flexibility, dynamism, quality and utilization. we always expect to be better than your expectations.<br><br>The installation system will guide you through the installation or upgrading from a previous version to the latest one. Each question, a problem, please dont hesitate to ask our development and support in case of doubt!<br><br>The 2Moons is an Open Source project, licensed under the GNU GPL v3. For this to be verified, please click the link above where it refers to "lincense"<br><br>Before the installation can be started a small test to see if your plan/domain has all the requirements to support the 2Moons';
$LNG['intro_upgrade_head'] = '2Moons already installed?';
$LNG['intro_upgrade_text'] = '<p>Update an existing 2Moons installation.</p><p>The wizard will guide you through the database upgrade.</p>';


$LNG['upgrade_success'] = 'Database updated successfully to revision %s.';
$LNG['upgrade_nothingtodo'] = 'No update required. The database is already at revision %s.';
$LNG['upgrade_back'] = 'Back';
$LNG['upgrade_intro_welcome'] = 'Welcome to the database updater!';
$LNG['upgrade_available'] = 'The database can be updated from revision %s to revision %s.<br><br>Select the first SQL update to install:';
$LNG['upgrade_notavailable'] = 'Revision %s is the latest database revision.';
$LNG['upgrade_required_rev'] = 'The updater requires revision r2579 (2Moons v1.7) or later.';


$LNG['licence_head'] = 'License terms';
$LNG['licence_desc'] = 'Please read the license terms below. Scroll to read the entire document.';
$LNG['licence_accept'] = 'Accept the license terms to continue installing 2Moons.';
$LNG['licence_need_accept'] = 'You must accept the license terms to continue.';

$LNG['req_head'] = 'System requirements';
$LNG['req_desc'] = 'The installer checks whether your server meets the requirements. Review the results before continuing.';
$LNG['reg_yes']					= 'Yes';
$LNG['reg_no']					= 'No';
$LNG['reg_found']				= 'Found';
$LNG['reg_not_found']			= 'Not found';
$LNG['reg_writable']			= 'Recordable';
$LNG['reg_not_writable']		= 'Not recordable';
$LNG['reg_file'] = 'Is file &raquo;%s&laquo; writable?';
$LNG['reg_dir'] = 'Is directory &raquo;%s&laquo; writable?';
$LNG['req_php_need']			= 'Installed version of the scripting language &raquo;PHP&laquo;';
$LNG['req_php_need_desc'] = '<strong>Required</strong> — PHP runs the game. The installer checks the required version.';
$LNG['reg_gd_need']				= 'Installed version of the GD PHP Script &raquo;gdlib&laquo;';
$LNG['reg_gd_desc'] = '<strong>Optional</strong> — The GD extension generates dynamic images.';
$LNG['reg_json_need']			= 'Extension &raquo;JSON&laquo; avaliable?';
$LNG['reg_iniset_need']			= 'PHP function &raquo;ini_set&laquo; avaliable?';
$LNG['reg_global_need']			= 'register_globals disabled?';
$LNG['reg_global_desc'] = 'For security, register_globals should be disabled in the PHP configuration.';
$LNG['req_ftp_head'] = 'FTP connection details';
$LNG['req_ftp_desc'] = 'Enter FTP connection details to repair file permissions, or set write permissions manually.';
$LNG['req_ftp_host']			= 'Hostname';
$LNG['req_ftp_username']		= 'User name';
$LNG['req_ftp_password']		= 'Password';
$LNG['req_ftp_dir']				= 'Directory of 2Moons';
$LNG['req_ftp_send']			= 'Send';
$LNG['req_ftp_error_data'] = 'Could not connect to the FTP server with these credentials.';
$LNG['req_ftp_error_dir'] = 'The specified directory is invalid or does not exist.';
$LNG['reg_pdo_active'] = 'PDO extension available?';
$LNG['reg_pdo_desc'] = '<strong>Required</strong> — PHP must support PDO database connections.';

$LNG['step1_head'] = 'Database configuration';
$LNG['step1_desc'] = 'Enter the database connection details. Contact your hosting provider if you do not know these settings.';
$LNG['step1_mysql_server']		= 'Database server or DSN';
$LNG['step1_mysql_port']		= 'Database port';
$LNG['step1_mysql_dbuser']		= 'Database user';
$LNG['step1_mysql_dbpass']		= 'Database Password';
$LNG['step1_mysql_dbname']		= 'Database name';
$LNG['step1_mysql_prefix']		= 'Table prefix:';

$LNG['step2_prefix_invalid']	= 'The prefix of the database must contain alphanumeric characters and underscore as last character';
$LNG['step2_db_no_dbname'] = 'Enter a database name.';
$LNG['step2_db_too_long'] = 'The table prefix must not exceed 36 characters.';
$LNG['step2_db_con_fail'] = 'Could not connect to the database. Details:';
$LNG['step2_conf_op_fail']		= "config.php can't be written!";
$LNG['step2_conf_create']		= 'config.php created successfully!';
$LNG['step2_config_exists'] = 'config.php already exists!';
$LNG['step2_db_done'] = 'Database connection successful!';

$LNG['step3_head'] = 'Create database tables';
$LNG['step3_desc'] = 'Create the database tables and populate them with their initial values.';
$LNG['step3_db_error'] = 'Could not create the database tables:';

$LNG['step4_head'] = 'Administrator account';
$LNG['step4_desc'] = 'Enter the username, password and email address for the administrator account.';
$LNG['step4_admin_name'] = 'Administrator username:';
$LNG['step4_admin_name_desc'] = 'Enter a username of 3 to 20 characters.';
$LNG['step4_admin_pass'] = 'Administrator password:';
$LNG['step4_admin_pass_desc'] = 'Enter a password of 6 to 30 characters.';
$LNG['step4_admin_mail'] = 'Contact email:';

$LNG['step6_head'] = 'Installation completed!';
$LNG['step6_desc'] = '2Moons was installed successfully.';
$LNG['step6_info_head'] = 'Start using 2Moons';
$LNG['step6_info_additional'] = 'Sign in with the administrator account you just created, then select Administration in the game menu.<br><br>The installer locks automatically. Confirm that includes/ENABLE_INSTALL_TOOL is absent.';

$LNG['step8_need_fields'] = 'Fill in all fields.';


$LNG['sql_close_reason']		= 'The game is closed';
$LNG['sql_welcome']				= 'Welcome to 2Moons v';
$LNG['reg_mysqli_active'] = 'MySQLi extension available?';
$LNG['reg_mysqli_desc'] = 'PHP support for MySQLi database connections.';
$LNG['reg_bcmath_need'] = 'BCMath extension available?';
$LNG['req_ftp_pass_info'] = 'Password for the FTP account.';
$LNG['step2_db_create_ok'] = 'Database created successfully.';
$LNG['sql_universe'] = 'Universe';
$LNG['intro_instal'] = 'Start installation';
$LNG['req_ftp'] = 'FTP connection details';
$LNG['req_ftp_info'] = 'Enter FTP connection details to repair file permissions, or set write permissions manually.';
$LNG['step2_db_error'] = 'Could not connect to the database. Details:';
$LNG['step2_db_connet_ok'] = 'Database connection successful!';
$LNG['step3_create_admin'] = 'Administrator account';
$LNG['step3_admin_name'] = 'Administrator username:';
$LNG['step3_admin_pass'] = 'Administrator password:';
$LNG['step3_admin_mail'] = 'Contact email:';
$LNG['step4_need_fields'] = 'Fill in all fields.';
