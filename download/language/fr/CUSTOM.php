<?php

/**
 *  2Moons
 *  Copyright (C) 2011  Slaver
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @package 2Moons
 * @author Slaver <slaver7@gmail.com>
 * @copyright 2009 Lucky <lucky@xgproyect.net> (XGProyecto)
 * @copyright 2011 Slaver <slaver7@gmail.com> (Fork/2Moons)
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 1.5 (2011-07-31)
 * @info $Id: CUSTOM.php 2095 2011-12-21 19:39:40Z slaver7 $
 * @link http://code.google.com/p/2moons/
 */
 
// If you have custom lang vars, you can include them here. The file ll be not overwrite by updatemanager
// Also you can overwrite exists var, too. You use the same key.
$LNG['ui_yes'] = 'Oui';
$LNG['ui_no'] = 'Non';
$LNG['ui_active'] = 'Actif';
$LNG['ui_inactive'] = 'Inactif';
$LNG['ui_loading_page'] = 'Chargement de la page, veuillez patienter...';
$LNG['ui_enable_javascript'] = 'Veuillez activer JavaScript pour continuer à jouer.';
$LNG['ui_outdated_browser'] = 'Votre navigateur est obsolète et peut afficher cette page incorrectement. Veuillez le mettre à jour :';
$LNG['ui_or'] = 'ou';
$LNG['ui_project_homepage'] = 'Site du projet';
$LNG['ui_project_title'] = 'Projet Gala.xyz';
$LNG['ui_powered_by'] = 'Propulsé par';
$LNG['ui_image'] = 'Image';
$LNG['ui_history'] = 'Historique';
$LNG['info_server_heading'] = 'Informations du serveur';
$LNG['info_server_software'] = 'Logiciel du serveur';
$LNG['info_php_version'] = 'Version de PHP';
$LNG['info_json_available'] = 'JSON disponible';
$LNG['info_bcmath_available'] = 'BCMath disponible';
$LNG['info_curl_available'] = 'cURL disponible';
$LNG['info_safe_mode'] = 'Mode sécurisé';
$LNG['info_memory_limit'] = 'Limite de mémoire';
$LNG['info_mysql_client'] = 'Version du client MySQL';
$LNG['info_mysql_server'] = 'Version du serveur MySQL';
$LNG['info_error_log'] = 'Journal des erreurs';
$LNG['info_timezone'] = 'Fuseau horaire (PHP/configuration/utilisateur)';
$LNG['info_db_version'] = 'Version de la base de données';
$LNG['info_game_heading'] = 'Jeu';
$LNG['info_game_version'] = 'Version du jeu';
$LNG['info_game_address'] = 'Adresse du jeu';
$LNG['info_game_path'] = 'Chemin du jeu';
$LNG['info_browser'] = 'Navigateur';
$LNG['redirectPostMessage'] = 'Redirection, veuillez patienter...';
$LNG['type_planet_short'][1] = 'P';
$LNG['type_planet_short'][2] = 'CD';
$LNG['type_planet_short'][3] = 'L';
$LNG['ui_commander'] = 'Commandant';
$LNG['ui_close'] = 'Fermer';
$LNG['ui_versus'] = 'contre';
$LNG['ui_sound_enable'] = 'Activer la musique de fond';
$LNG['ui_sound_mute'] = 'Couper la musique de fond';
$LNG['ui_register_rate_limit'] = 'Trop de tentatives d’inscription. Réessayez dans 15 minutes.';
$LNG['ui_register_expired'] = 'Le formulaire est invalide ou a expiré. Ouvrez un nouveau formulaire.';
$LNG['ui_captcha_image'] = 'Code de sécurité de l’inscription';
$LNG['ui_captcha_refresh'] = 'Nouveau code';
$LNG['ui_captcha_help'] = 'Saisissez les six caractères de l’image. La casse n’a pas d’importance.';
$LNG['ui_registration_security'] = 'Sécurité de l’inscription';
$LNG['ui_captcha_provider'] = 'Vérification humaine';
$LNG['ui_captcha_local'] = 'CAPTCHA local avec image';
$LNG['ui_captcha_settings_help'] = 'Le CAPTCHA local fonctionne sans clés externes. Turnstile et reCAPTCHA nécessitent leurs propres clés publique et secrète. Utilisez des clés réelles pour le domaine public.';
$LNG['ui_npc_title'] = 'Robots NPC';
$LNG['ui_npc_help'] = 'Les comptes NPC portent le préfixe NPC. Toutes les cinq minutes, 10 % du budget quotidien est ajouté en ressources et 90 % en vaisseaux stationnés. Les pertes au combat restent réelles. Aucune attaque automatique. Maximum : 20 par création et 200 par univers. La croissance commence à zéro ; la pause arrête la croissance.';
$LNG['ui_npc_create'] = 'Créer des robots NPC';
$LNG['ui_npc_count'] = 'Nombre de robots';
$LNG['ui_npc_budget'] = 'Budget quotidien par NPC (unités de ressources)';
$LNG['ui_npc_status'] = 'État';
$LNG['ui_npc_save'] = 'Enregistrer';
$LNG['ui_npc_active'] = 'Actif';
$LNG['ui_npc_paused'] = 'En pause';
$LNG['ui_npc_empty'] = 'Aucun robot NPC dans cet univers.';
$LNG['ui_npc_created'] = '%d robots NPC créés.';
$LNG['ui_npc_saved'] = 'Paramètres NPC enregistrés.';
$LNG['ui_npc_error'] = 'Paramètres invalides, formulaire expiré, limite de NPC atteinte ou aucune position libre.';
$LNG['ui_npc_galaxy'] = 'Galaxie';
$LNG['ui_npc_system'] = 'Système solaire';
$LNG['ui_notice_title'] = 'Notification';
$LNG['ui_notice_close'] = 'Fermer';
$LNG['ui_notice_ok'] = 'OK';
$LNG['ui_notice_login'] = 'Se connecter';
