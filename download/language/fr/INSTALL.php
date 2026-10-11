<?php
// Traduction Française by BigTwoProduction (KickXAss4Ever & Apocalypto2202) - All rights reserved (C) 2016
// Web : http://www.big-two.tk
// Version 1.0 - Initial release
// Version 1.1 - Decode accent HTML to UTF-8 format & small spellchecking

$LNG['continue']			= "Continue";

$LNG['menu_intro']			= "Intro";
$LNG['menu_install']		= "Install";
$LNG['menu_license']		= "License";

$LNG['title_install']		= 'Installeur';

$LNG['intro_lang']			= "Language";
$LNG['intro_instal'] = 'Démarrer l\'installation';
$LNG['intro_welcome']		= "Bievenue dans 2Moons!";
$LNG['intro_text']			= "Un des meilleurs clones Ogame : 2 Moons.<br>The latest is and 2 Moons the stablest flat rate was ever developed. 2 of Moon shines by stability, flexibility, dynamics, quality and user-friendliness. We hope always to be better than her expectations.<br><br>The installation system guides you through the install or upgrade from an older version to the latest. On questions or trouble don't hesitate to contact us.<br><br>2Moons is an open source project licensed under the GNU GPL v3. For the license please click on the item in the menu.<br><br>Before the installation starts, a test is conducted, if system requirements are met.";

$LNG['reg_yes']				= "Oui";
$LNG['reg_no']				= "Non";
$LNG['reg_found']			= "Trouvé";
$LNG['reg_not_found']		= "Non trouvé";
$LNG['reg_writable']		= "Inscriptibles";
$LNG['reg_not_writable']	= "Non inscriptibles";
$LNG['reg_file'] = 'Le fichier &raquo;%s&laquo; est-il accessible en écriture ?';
$LNG['reg_dir'] = 'Le dossier &raquo;%s&laquo; est-il accessible en écriture ?';
$LNG['reg_gd_need']			= "GB-Lib disponible ?";
$LNG['reg_mysqli_active'] = 'Extension MySQLi disponible ?';
$LNG['reg_bcmath_need'] = 'Extension BCMath disponible ?';
$LNG['reg_iniset_need']		= "ini_set() disponible ?";
$LNG['reg_global_need']		= "register_globals desactivé ?";
$LNG['reg_json_need']		= "JSON disponible ?";
$LNG['req_php_need']		= "PHP-Version (min. 5.2.5)";
$LNG['req_ftp'] = 'Informations de connexion FTP';
$LNG['req_ftp_info'] = 'Saisissez les informations de connexion FTP pour corriger les permissions des fichiers, ou définissez les droits d\'écriture manuellement.';
$LNG['req_ftp_host']		= "FTP Host";
$LNG['req_ftp_username']	= "Username";
$LNG['req_ftp_password']	= "Password";
$LNG['req_ftp_dir']			= "Dossier de 2Moons";
$LNG['req_ftp_send']		= "Envoyer";
$LNG['req_ftp_pass_info'] = 'Mot de passe du compte FTP.';

$LNG['step1_mysql_server']	= "MySQL-DB-Server: <br>Standard: localhost";
$LNG['step1_mysql_port']	= "MySQL-DB-Server-Port: <br>Standard: 3306";
$LNG['step1_mysql_dbname']	= "MySQL-DB-Name: <br> Ex.: Game";
$LNG['step1_mysql_dbuser']	= "MySQL-DB-User: <br> Ex.: root";
$LNG['step1_mysql_dbpass']	= "MySQL-DB-Password: <br> Ex.: 12345";
$LNG['step1_mysql_prefix']	= "MySQL-DB-Prefix: <br> Ex.: uni1_";

$LNG['step2_db_error'] = 'Impossible de se connecter à la base de données. Détails :';
$LNG['step2_db_con_fail'] = 'Impossible de se connecter à la base de données. Détails :';
$LNG['step2_conf_op_fail']	= "config.php n'est pas en CHMOD 777!";
$LNG['step2_db_connet_ok'] = 'Connexion à la base de données réussie !';
$LNG['step2_db_create_ok'] = 'Base de données créée avec succès.';
$LNG['step2_conf_create']	= "config.php à été crée avec succès...";
$LNG['step2_prefix_invalid']	= 'Le préfixe DB doit contenir que des caractères alphanumériques et caractères de soulignement.';

$LNG['step3_create_admin'] = 'Compte administrateur';
$LNG['step3_admin_name'] = 'Nom d\'utilisateur de l\'administrateur :';
$LNG['step3_admin_pass'] = 'Mot de passe de l\'administrateur :';
$LNG['step3_admin_mail'] = 'Adresse e-mail de contact :';


$LNG['step4_need_fields'] = 'Remplissez tous les champs.';

$LNG['sql_universe'] = 'Univers';
$LNG['sql_close_reason']	= 'Le jeu est actuellement fermé';
$LNG['sql_welcome']			= 'Bienvenue sur ';
$LNG['back'] = 'Retour';
$LNG['continueUpgrade'] = 'Continuer la mise à jour';
$LNG['login'] = 'Se connecter';
$LNG['menu_upgrade'] = 'Mise à jour';
$LNG['intro_install'] = 'Démarrer l\'installation';
$LNG['intro_upgrade_head'] = '2Moons est déjà installé ?';
$LNG['intro_upgrade_text'] = '<p>Mettez à jour une installation existante de 2Moons.</p><p>L\'assistant vous guidera dans la mise à jour de la base de données.</p>';
$LNG['upgrade_success'] = 'Base de données mise à jour avec succès vers la révision %s.';
$LNG['upgrade_nothingtodo'] = 'Aucune mise à jour nécessaire. La base de données est déjà à la révision %s.';
$LNG['upgrade_back'] = 'Retour';
$LNG['upgrade_intro_welcome'] = 'Bienvenue dans l\'assistant de mise à jour de la base de données !';
$LNG['upgrade_available'] = 'La base de données peut être mise à jour de la révision %s à la révision %s.<br><br>Sélectionnez la première mise à jour SQL à installer :';
$LNG['upgrade_notavailable'] = 'La révision %s est la dernière révision de la base de données.';
$LNG['upgrade_required_rev'] = 'L\'assistant nécessite la révision r2579 (2Moons v1.7) ou ultérieure.';
$LNG['licence_head'] = 'Conditions de la licence';
$LNG['licence_desc'] = 'Veuillez lire les conditions de la licence ci-dessous. Faites défiler le document pour le lire entièrement.';
$LNG['licence_accept'] = 'Acceptez les conditions de la licence pour poursuivre l\'installation de 2Moons.';
$LNG['licence_need_accept'] = 'Vous devez accepter les conditions de la licence pour continuer.';
$LNG['req_head'] = 'Configuration requise';
$LNG['req_desc'] = 'L\'assistant vérifie si votre serveur répond aux exigences. Examinez les résultats avant de continuer.';
$LNG['req_php_need_desc'] = '<strong>Requis</strong> — PHP exécute le jeu. L\'assistant vérifie la version requise.';
$LNG['reg_gd_desc'] = '<strong>Facultatif</strong> — L\'extension GD génère des images dynamiques.';
$LNG['reg_global_desc'] = 'Pour des raisons de sécurité, register_globals doit être désactivé dans la configuration PHP.';
$LNG['req_ftp_head'] = 'Informations de connexion FTP';
$LNG['req_ftp_desc'] = 'Saisissez les informations de connexion FTP pour corriger les permissions des fichiers, ou définissez les droits d\'écriture manuellement.';
$LNG['req_ftp_error_data'] = 'Impossible de se connecter au serveur FTP avec ces identifiants.';
$LNG['req_ftp_error_dir'] = 'Le dossier indiqué est invalide ou n\'existe pas.';
$LNG['reg_pdo_active'] = 'Extension PDO disponible ?';
$LNG['reg_pdo_desc'] = '<strong>Requis</strong> — PHP doit prendre en charge les connexions aux bases de données via PDO.';
$LNG['reg_mysqli_desc'] = 'Prise en charge des connexions MySQLi par PHP.';
$LNG['step1_head'] = 'Configuration de la base de données';
$LNG['step1_desc'] = 'Saisissez les informations de connexion à la base de données. Contactez votre hébergeur si vous ne connaissez pas ces paramètres.';
$LNG['step2_db_no_dbname'] = 'Saisissez un nom de base de données.';
$LNG['step2_db_too_long'] = 'Le préfixe des tables ne doit pas dépasser 36 caractères.';
$LNG['step2_config_exists'] = 'config.php existe déjà !';
$LNG['step2_db_done'] = 'Connexion à la base de données réussie !';
$LNG['step3_head'] = 'Créer les tables de la base de données';
$LNG['step3_desc'] = 'Créez les tables de la base de données et insérez leurs valeurs initiales.';
$LNG['step3_db_error'] = 'Impossible de créer les tables de la base de données :';
$LNG['step4_head'] = 'Compte administrateur';
$LNG['step4_desc'] = 'Saisissez le nom d\'utilisateur, le mot de passe et l\'adresse e-mail du compte administrateur.';
$LNG['step4_admin_name'] = 'Nom d\'utilisateur de l\'administrateur :';
$LNG['step4_admin_name_desc'] = 'Saisissez un nom d\'utilisateur de 3 à 20 caractères.';
$LNG['step4_admin_pass'] = 'Mot de passe de l\'administrateur :';
$LNG['step4_admin_pass_desc'] = 'Saisissez un mot de passe de 6 à 30 caractères.';
$LNG['step4_admin_mail'] = 'Adresse e-mail de contact :';
$LNG['step6_head'] = 'Installation terminée !';
$LNG['step6_desc'] = '2Moons a été installé avec succès.';
$LNG['step6_info_head'] = 'Commencer à utiliser 2Moons';
$LNG['step6_info_additional'] = 'Le bouton ci-dessous ouvre le panneau d\'administration.<br><br><strong>Supprimez ou renommez includes/ENABLE_INSTALL_TOOL pour empêcher la réutilisation de l\'assistant d\'installation.</strong>';
$LNG['step8_need_fields'] = 'Remplissez tous les champs.';
