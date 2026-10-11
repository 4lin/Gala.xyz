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

$LNG['back'] = 'Zurück';
$LNG['continue']				= 'Weiter';
$LNG['continueUpgrade'] = 'Aktualisierung fortsetzen';
$LNG['login'] = 'Anmelden';

$LNG['menu_intro']				= 'Intro';
$LNG['menu_install']			= 'Installieren';
$LNG['menu_license']			= 'Lizenz';
$LNG['menu_upgrade'] = 'Aktualisierung';

$LNG['title_install']			= 'Installer';

$LNG['intro_lang']				= 'Sprache';
$LNG['intro_install'] = 'Installation starten';
$LNG['intro_welcome']			= 'Herzlich Willkommen beim 2Moons!';
$LNG['intro_text']				= '2Moons ist eines der besten Klone von OGame.<br>2Moons ist die neueste und stabilste XNova Version je entwickelt wurde. 2Moons glänzt durch Stabilität, Flexibilität, Dynamik, Qualität und Benutzerfreundlichkeit. Wir hoffen immer besser zu sein als ihre Erwartungen.<br><br>Das Installations-System führt Sie durch die Installation, oder Upgrade auf einer vorherigen Version auf die neueste ein. Jede Frage, ein Problem zögern Sie bitte nicht, unsere Entwicklung und Unterstützung zu ersuchen.<br><br>2Moons ist ein OpenSource-Projekt und ist under GNU GPL v3 lizenziert. Zur Lizenz klicken Sie bitte im Menu auf die entsprechenden Menüpunkt.<br><br>Bevor die Installation gestartet werden kann, wird vorher ein kleiner Test durchgeführt, ob sie die Mindestanforderungen unterstützen.';
$LNG['intro_upgrade_head'] = '2Moons bereits installiert?';
$LNG['intro_upgrade_text'] = '<p>Aktualisiere eine vorhandene 2Moons-Installation.</p><p>Der Assistent führt dich durch die Datenbankaktualisierung.</p>';

$LNG['upgrade_success'] = 'Datenbank erfolgreich auf Revision %s aktualisiert.';
$LNG['upgrade_nothingtodo'] = 'Keine Aktualisierung nötig. Die Datenbank hat bereits Revision %s.';
$LNG['upgrade_back'] = 'Zurück';
$LNG['upgrade_intro_welcome'] = 'Willkommen beim Datenbank-Updater!';
$LNG['upgrade_available'] = 'Die Datenbank kann von Revision %s auf Revision %s aktualisiert werden.<br><br>Wähle das erste zu installierende SQL-Update:';
$LNG['upgrade_notavailable'] = 'Revision %s ist die neueste Datenbankrevision.';
$LNG['upgrade_required_rev'] = 'Der Updater benötigt Revision r2579 (2Moons v1.7) oder neuer.';

$LNG['licence_head'] = 'Lizenzbedingungen';
$LNG['licence_desc'] = 'Bitte lies die folgenden Lizenzbedingungen. Scrolle, um das gesamte Dokument zu lesen.';
$LNG['licence_accept'] = 'Akzeptiere die Lizenzbedingungen, um die Installation von 2Moons fortzusetzen.';
$LNG['licence_need_accept'] = 'Du musst die Lizenzbedingungen akzeptieren, um fortzufahren.';

$LNG['req_head'] = 'Systemanforderungen';
$LNG['req_desc'] = 'Der Installer prüft, ob dein Server die Anforderungen erfüllt. Prüfe die Ergebnisse, bevor du fortfährst.';
$LNG['reg_yes']					= 'Ja';
$LNG['reg_no']					= 'Nein';
$LNG['reg_found']				= 'Gefunden';
$LNG['reg_not_found']			= 'Nicht Gefunden';
$LNG['reg_writable']			= 'Beschreibbar';
$LNG['reg_not_writable']		= 'Nicht Beschreibbar';
$LNG['reg_file'] = 'Ist die Datei &raquo;%s&laquo; beschreibbar?';
$LNG['reg_dir'] = 'Ist das Verzeichnis &raquo;%s&laquo; beschreibbar?';
$LNG['req_php_need']			= 'Installierte Version der Skriptsprache &raquo;PHP&laquo;';
$LNG['req_php_need_desc'] = '<strong>Erforderlich</strong> — PHP führt das Spiel aus. Der Installer prüft die benötigte Version.';
$LNG['reg_gd_need']				= 'Installierte Version der Grafikbearbeitungs-Bibliothek &raquo;gdlib&laquo;';
$LNG['reg_gd_desc'] = '<strong>Optional</strong> — Die GD-Erweiterung erzeugt dynamische Bilder.';
$LNG['reg_pdo_active'] = 'PDO-Erweiterung verfügbar?';
$LNG['reg_pdo_desc'] = '<strong>Erforderlich</strong> — PHP muss PDO-Datenbankverbindungen unterstützen.';
$LNG['reg_json_need']			= 'Erweiterung &raquo;JSON&laquo; verfügbar?';
$LNG['reg_iniset_need']			= 'PHP-Funktion &raquo;ini_set&laquo; vorhanden?';
$LNG['reg_global_need']			= 'register_globals deaktiviert?';
$LNG['reg_global_desc'] = 'Aus Sicherheitsgründen sollte register_globals in der PHP-Konfiguration deaktiviert sein.';
$LNG['req_ftp_head'] = 'FTP-Verbindungsdaten';
$LNG['req_ftp_desc'] = 'Gib die FTP-Verbindungsdaten ein, um Dateirechte zu korrigieren, oder setze die Schreibrechte manuell.';
$LNG['req_ftp_host']			= 'Hostname';
$LNG['req_ftp_username']		= 'Benutzername';
$LNG['req_ftp_password']		= 'Kennwort';
$LNG['req_ftp_dir']				= 'Installationspfad zu 2Moons';
$LNG['req_ftp_send']			= 'Absenden';
$LNG['req_ftp_error_data'] = 'Mit diesen Zugangsdaten konnte keine Verbindung zum FTP-Server hergestellt werden.';
$LNG['req_ftp_error_dir'] = 'Das angegebene Verzeichnis ist ungültig oder existiert nicht.';

$LNG['step1_head'] = 'Datenbankkonfiguration';
$LNG['step1_desc'] = 'Gib die Datenbank-Verbindungsdaten ein. Wende dich an deinen Hosting-Anbieter, falls du diese Einstellungen nicht kennst.';
$LNG['step1_mysql_server']		= 'Datenbankserver-Hostname oder DSN';
$LNG['step1_mysql_port']		= 'Datenbankserver-Port';
$LNG['step1_mysql_dbuser']		= 'Datenbank-Benutzername';
$LNG['step1_mysql_dbpass']		= 'Datenbank-Passwort';
$LNG['step1_mysql_dbname']		= 'Name der Datenbank';
$LNG['step1_mysql_prefix']		= 'Tabellenprefix:';

$LNG['step2_prefix_invalid']	= 'Der DB-Prefix darf nur alphanumerische Zeichen und Unterstriche enthalten.';
$LNG['step2_db_no_dbname'] = 'Gib einen Datenbanknamen ein.';
$LNG['step2_db_too_long'] = 'Das Tabellenpräfix darf höchstens 36 Zeichen lang sein.';
$LNG['step2_db_con_fail'] = 'Keine Verbindung zur Datenbank möglich. Details:';
$LNG['step2_config_exists'] = 'config.php existiert bereits!';
$LNG['step2_conf_op_fail']		= 'config.php ist nicht beschreibbar!';
$LNG['step2_conf_create']		= 'config.php erfolgreich erstellt...';
$LNG['step2_db_done'] = 'Datenbankverbindung erfolgreich!';

$LNG['step3_head'] = 'Datenbanktabellen erstellen';
$LNG['step3_desc'] = 'Erstelle die Datenbanktabellen und fülle sie mit ihren Anfangswerten.';
$LNG['step3_db_error'] = 'Die Datenbanktabellen konnten nicht erstellt werden:';

$LNG['step4_head'] = 'Administratorkonto';
$LNG['step4_desc'] = 'Gib Benutzername, Passwort und E-Mail-Adresse für das Administratorkonto ein.';
$LNG['step4_admin_name'] = 'Administrator-Benutzername:';
$LNG['step4_admin_name_desc'] = 'Gib einen Benutzernamen mit 3 bis 20 Zeichen ein.';
$LNG['step4_admin_pass'] = 'Administrator-Passwort:';
$LNG['step4_admin_pass_desc'] = 'Gib ein Passwort mit 6 bis 30 Zeichen ein.';
$LNG['step4_admin_mail'] = 'Kontakt-E-Mail:';

$LNG['step6_head'] = 'Installation abgeschlossen!';
$LNG['step6_desc'] = '2Moons wurde erfolgreich installiert.';
$LNG['step6_info_head'] = '2Moons verwenden';
$LNG['step6_info_additional'] = 'Die folgende Schaltfläche öffnet den Administrationsbereich.<br><br><strong>Lösche oder benenne includes/ENABLE_INSTALL_TOOL um, damit der Installer nicht erneut verwendet werden kann.</strong>';

$LNG['step8_need_fields'] = 'Fülle alle Felder aus.';

$LNG['sql_close_reason']		= 'Game ist zurzeit geschlossen';
$LNG['sql_welcome']				= 'Herzlich Willkommen zu 2Moons v';
$LNG['reg_mysqli_active'] = 'MySQLi-Erweiterung verfügbar?';
$LNG['reg_mysqli_desc'] = 'PHP-Unterstützung für MySQLi-Datenbankverbindungen.';
$LNG['reg_bcmath_need'] = 'BCMath-Erweiterung verfügbar?';
$LNG['req_ftp_pass_info'] = 'Passwort des FTP-Kontos.';
$LNG['step2_db_create_ok'] = 'Datenbank erfolgreich erstellt.';
$LNG['sql_universe'] = 'Universum';
$LNG['intro_instal'] = 'Installation starten';
$LNG['req_ftp'] = 'FTP-Verbindungsdaten';
$LNG['req_ftp_info'] = 'Gib die FTP-Verbindungsdaten ein, um Dateirechte zu korrigieren, oder setze die Schreibrechte manuell.';
$LNG['step2_db_error'] = 'Keine Verbindung zur Datenbank möglich. Details:';
$LNG['step2_db_connet_ok'] = 'Datenbankverbindung erfolgreich!';
$LNG['step3_create_admin'] = 'Administratorkonto';
$LNG['step3_admin_name'] = 'Administrator-Benutzername:';
$LNG['step3_admin_pass'] = 'Administrator-Passwort:';
$LNG['step3_admin_mail'] = 'Kontakt-E-Mail:';
$LNG['step4_need_fields'] = 'Fülle alle Felder aus.';
