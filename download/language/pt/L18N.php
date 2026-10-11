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

setlocale(LC_ALL, 'pt_PT.UTF-8', 'pt_PT', 'portuguese'); // http://msdn.microsoft.com/en-us/library/39cwe7zf%28vs.71%29.aspx
setlocale(LC_NUMERIC, 'C');

//SERVER GENERALS
$LNG['dir']         	= 'ltr';
$LNG['week_day']		= array('So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa'); # Start with So!
$LNG['months']			= array('Jan', 'Feb', 'Mar', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez');
$LNG['js_tdformat']		= '[M] [D] [d] [H]:[i]:[s]';
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
  0 => 'Dom',
  1 => 'Seg',
  2 => 'Ter',
  3 => 'Qua',
  4 => 'Qui',
  5 => 'Sex',
  6 => 'Sáb',
);
$LNG['months'] = array (
  0 => 'Jan',
  1 => 'Fev',
  2 => 'Mar',
  3 => 'Abr',
  4 => 'Mai',
  5 => 'Jun',
  6 => 'Jul',
  7 => 'Ago',
  8 => 'Set',
  9 => 'Out',
  10 => 'Nov',
  11 => 'Dez',
);
$LNG['timezones'] = array (
  -12 => '[UTC - 12] Hora: ilha Baker',
  -11 => '[UTC - 11] Hora: Niue, Samoa',
  -10 => '[UTC - 10] Hora: Havai e Aleutas, ilhas Cook',
  '-9.5' => '[UTC - 9:30] Hora: ilhas Marquesas',
  -9 => '[UTC - 9] Hora: Alasca, ilhas Gambier',
  -8 => '[UTC - 8] Hora: do Pacífico',
  -7 => '[UTC - 7] Hora: das Montanhas',
  -6 => '[UTC - 6] Hora: central',
  -5 => '[UTC - 5] Hora: oriental',
  '-4.5' => '[UTC - 4:30] Hora: Venezuela',
  -4 => '[UTC - 4] Hora: do Atlântico',
  '-3.5' => '[UTC - 3:30] Hora: Terra Nova',
  -3 => '[UTC - 3] Hora: Amazonas, centro da Gronelândia',
  -2 => '[UTC - 2] Hora: Fernando de Noronha, Geórgia do Sul e ilhas Sandwich do Sul',
  -1 => '[UTC - 1] Hora: Açores, Cabo Verde, leste da Gronelândia',
  0 => '[UTC] Hora: Europa Ocidental, Greenwich',
  1 => '[UTC + 1] Hora: Europa Central, África Ocidental',
  2 => '[UTC + 2] Hora: Europa Oriental, África Central',
  3 => '[UTC + 3] Hora: Moscovo, África Oriental',
  '3.5' => '[UTC + 3:30] Hora: Irão',
  4 => '[UTC + 4] Hora: Golfo Pérsico, Samara',
  '4.5' => '[UTC + 4:30] Hora: Afeganistão',
  5 => '[UTC + 5] Hora: Paquistão, Ecaterimburgo',
  '5.5' => '[UTC + 5:30] Hora: Índia, Sri Lanka',
  '5.75' => '[UTC + 5:45] Hora: Nepal',
  6 => '[UTC + 6] Hora: Bangladesh, Butão, Novosibirsk',
  '6.5' => '[UTC + 6:30] Hora: ilhas Cocos, Myanmar',
  7 => '[UTC + 7] Hora: Indochina, Krasnoiarsk',
  8 => '[UTC + 8] Hora: China, Austrália Ocidental, Irkutsk',
  '8.75' => '[UTC + 8:45] Hora: sudeste da Austrália Ocidental',
  9 => '[UTC + 9] Hora: Japão, Coreia, Tchita',
  '9.5' => '[UTC + 9:30] Hora: Austrália Central',
  10 => '[UTC + 10] Hora: Austrália Oriental, Vladivostok',
  '10.5' => '[UTC + 10:30] Hora: ilha Lord Howe',
  11 => '[UTC + 11] Hora: ilhas Salomão, Magadan',
  '11.5' => '[UTC + 11:30] Hora: ilha Norfolk',
  12 => '[UTC + 12] Hora: Nova Zelândia, Fiji, Kamchatka',
  '12.75' => '[UTC + 12:45] Hora: ilhas Chatham',
  13 => '[UTC + 13] Hora: Tonga, ilhas Fénix',
  14 => '[UTC + 14] Hora: ilhas da Linha',
);
