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

// Turkce'ye Ibrahim Senyer tarafindan cevirilmistir. Butun Haklari saklidir (C) 2013
// 2Moons - Copyright (C) 2010-2012 Slaver
// Translated into Turkish by Ibraihm Senyer . All rights reversed (C) 2013
// 2Moons - Copyright (C) 2010-2012 Slaver


setlocale(LC_ALL, 'tr_TR.UTF-8', 'tr_TR', 'turkish'); // http://msdn.microsoft.com/en-us/library/39cwe7zf%28vs.71%29.aspx
setlocale(LC_NUMERIC, 'C');

//SERVER GENERALS
$LNG['dir']         	= 'ltr';
$LNG['week_day']		= array('Pazar', 'Pazartesi', 'Sali', 'Carsamba', 'Persembe', 'Cuma', 'Cumartesi'); # Start with Sun!
$LNG['months']			= array('Ocak', 'Subat', 'Mart', 'Nisan', 'Mayis', 'Haziran', 'Temmuz', 'Agustos', 'Eylul', 'Ekim', 'Kasim', 'Aralik');
$LNG['js_tdformat']		= '[d] [M] [D] [H]:[i]:[s]';
$LNG['php_timeformat']	= 'H:i:s';
$LNG['php_dateformat']	= 'd. M Y';
$LNG['php_tdformat']	= 'd. M Y, H:i:s';
$LNG['short_day']		= 'd';
$LNG['short_hour']		= 'h';
$LNG['short_minute']	= 'm';
$LNG['short_second']	= 's';

//Note for the translators, use the phpBB Translation file (LANG/common.php) instead of your own translations

$LNG['timezones']		= array(
	'-12'	=> '[UTC - 12] Baker Island Time',
	'-11'	=> '[UTC - 11] Niue Time, Samoa Standard Time',
	'-10'	=> '[UTC - 10] Hawaii-Aleutian Standard Time, Cook Island Time',
	'-9.5'	=> '[UTC - 9:30] Marquesas Islands Time',
	'-9'	=> '[UTC - 9] Alaska Standard Time, Gambier Island Time',
	'-8'	=> '[UTC - 8] Pacific Standard Time',
	'-7'	=> '[UTC - 7] Mountain Standard Time',
	'-6'	=> '[UTC - 6] Central Standard Time',
	'-5'	=> '[UTC - 5] Eastern Standard Time',
	'-4.5'	=> '[UTC - 4:30] Venezuelan Standard Time',
	'-4'	=> '[UTC - 4] Atlantic Standard Time',
	'-3.5'	=> '[UTC - 3:30] Newfoundland Standard Time',
	'-3'	=> '[UTC - 3] Amazon Standard Time, Central Greenland Time',
	'-2'	=> '[UTC - 2] Fernando de Noronha Time, South Georgia &amp; the South Sandwich Islands Time',
	'-1'	=> '[UTC - 1] Azores Standard Time, Cape Verde Time, Eastern Greenland Time',
	'0'		=> '[UTC] Westeuropäische Zeit, Greenwich Mean Time',
	'1'		=> '[UTC + 1] Mitteleuropäische Zeit, West African Time',
	'2'		=> '[UTC + 2] Osteuropäische Zeit, Central African Time',
	'3'		=> '[UTC + 3] Moscow Standard Time, Eastern African Time',
	'3.5'	=> '[UTC + 3:30] Iran Standard Time',
	'4'		=> '[UTC + 4] Gulf Standard Time, Samara Standard Time',
	'4.5'	=> '[UTC + 4:30] Afghanistan Time',
	'5'		=> '[UTC + 5] Pakistan Standard Time, Yekaterinburg Standard Time',
	'5.5'	=> '[UTC + 5:30] Indian Standard Time, Sri Lanka Time',
	'5.75'	=> '[UTC + 5:45] Nepal Time',
	'6'		=> '[UTC + 6] Bangladesh Time, Bhutan Time, Novosibirsk Standard Time',
	'6.5'	=> '[UTC + 6:30] Cocos Islands Time, Myanmar Time',
	'7'		=> '[UTC + 7] Indochina Time, Krasnoyarsk Standard Time',
	'8'		=> '[UTC + 8] Chinese Standard Time, Australian Western Standard Time, Irkutsk Standard Time',
	'8.75'	=> '[UTC + 8:45] Southeastern Western Australia Standard Time',
	'9'		=> '[UTC + 9] Japan Standard Time, Korea Standard Time, Chita Standard Time',
	'9.5'	=> '[UTC + 9:30] Australian Central Standard Time',
	'10'	=> '[UTC + 10] Australian Eastern Standard Time, Vladivostok Standard Time',
	'10.5'	=> '[UTC + 10:30] Lord Howe Standard Time',
	'11'	=> '[UTC + 11] Solomon Island Time, Magadan Standard Time',
	'11.5'	=> '[UTC + 11:30] Norfolk Island Time',
	'12'	=> '[UTC + 12] New Zealand Time, Fiji Time, Kamchatka Standard Time',
	'12.75'	=> '[UTC + 12:45] Chatham Islands Time',
	'13'	=> '[UTC + 13] Tonga Time, Phoenix Islands Time',
	'14'	=> '[UTC + 14] Line Island Time',
);
$LNG['week_day'] = array (
  0 => 'Pazar',
  1 => 'Pazartesi',
  2 => 'Salı',
  3 => 'Çarşamba',
  4 => 'Perşembe',
  5 => 'Cuma',
  6 => 'Cumartesi',
);
$LNG['months'] = array (
  0 => 'Ocak',
  1 => 'Şubat',
  2 => 'Mart',
  3 => 'Nisan',
  4 => 'Mayıs',
  5 => 'Haziran',
  6 => 'Temmuz',
  7 => 'Ağustos',
  8 => 'Eylül',
  9 => 'Ekim',
  10 => 'Kasım',
  11 => 'Aralık',
);
$LNG['timezones'] = array (
  -12 => '[UTC - 12] Saat: Baker Adası',
  -11 => '[UTC - 11] Saat: Niue, Samoa',
  -10 => '[UTC - 10] Saat: Hawaii-Aleut, Cook Adaları',
  '-9.5' => '[UTC - 9:30] Saat: Markiz Adaları',
  -9 => '[UTC - 9] Saat: Alaska, Gambier Adaları',
  -8 => '[UTC - 8] Saat: Pasifik',
  -7 => '[UTC - 7] Saat: Dağ',
  -6 => '[UTC - 6] Saat: Merkez',
  -5 => '[UTC - 5] Saat: Doğu',
  '-4.5' => '[UTC - 4:30] Saat: Venezuela',
  -4 => '[UTC - 4] Saat: Atlantik',
  '-3.5' => '[UTC - 3:30] Saat: Newfoundland',
  -3 => '[UTC - 3] Saat: Amazon, Orta Grönland',
  -2 => '[UTC - 2] Saat: Fernando de Noronha, Güney Georgia ve Güney Sandwich Adaları',
  -1 => '[UTC - 1] Saat: Azorlar, Yeşil Burun Adaları, Doğu Grönland',
  0 => '[UTC] Saat: Batı Avrupa, Greenwich',
  1 => '[UTC + 1] Saat: Orta Avrupa, Batı Afrika',
  2 => '[UTC + 2] Saat: Doğu Avrupa, Orta Afrika',
  3 => '[UTC + 3] Saat: Moskova, Doğu Afrika',
  '3.5' => '[UTC + 3:30] Saat: İran',
  4 => '[UTC + 4] Saat: Basra Körfezi, Samara',
  '4.5' => '[UTC + 4:30] Saat: Afganistan',
  5 => '[UTC + 5] Saat: Pakistan, Yekaterinburg',
  '5.5' => '[UTC + 5:30] Saat: Hindistan, Sri Lanka',
  '5.75' => '[UTC + 5:45] Saat: Nepal',
  6 => '[UTC + 6] Saat: Bangladeş, Bhutan, Novosibirsk',
  '6.5' => '[UTC + 6:30] Saat: Cocos Adaları, Myanmar',
  7 => '[UTC + 7] Saat: Çinhindi, Krasnoyarsk',
  8 => '[UTC + 8] Saat: Çin, Batı Avustralya, İrkutsk',
  '8.75' => '[UTC + 8:45] Saat: Batı Avustralya\'nın güneydoğusu',
  9 => '[UTC + 9] Saat: Japonya, Kore, Çita',
  '9.5' => '[UTC + 9:30] Saat: Orta Avustralya',
  10 => '[UTC + 10] Saat: Doğu Avustralya, Vladivostok',
  '10.5' => '[UTC + 10:30] Saat: Lord Howe Adası',
  11 => '[UTC + 11] Saat: Solomon Adaları, Magadan',
  '11.5' => '[UTC + 11:30] Saat: Norfolk Adası',
  12 => '[UTC + 12] Saat: Yeni Zelanda, Fiji, Kamçatka',
  '12.75' => '[UTC + 12:45] Saat: Chatham Adaları',
  13 => '[UTC + 13] Saat: Tonga, Phoenix Adaları',
  14 => '[UTC + 14] Saat: Line Adaları',
);
