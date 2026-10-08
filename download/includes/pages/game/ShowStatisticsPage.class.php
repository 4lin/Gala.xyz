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


class ShowStatisticsPage extends AbstractGamePage
{
    public static $requireModule = MODULE_STATISTICS;

	function __construct() 
	{
		parent::__construct();
	}

    function show()
    {
        global $USER, $LNG;

        $who   	= HTTP::_GP('who', 1);
        $type  	= HTTP::_GP('type', 1);
        $range 	= HTTP::_GP('range', 1);

        $who = in_array($who, array(1, 2), true) ? $who : 1;
        $type = in_array($type, array(1, 2, 3, 4, 5), true) ? $type : 1;
        $range = max(1, $range);

        switch ($type)
        {
            case 2:
                $Order   = "fleet_rank";
                $Points  = "fleet_points";
                $Rank    = "fleet_rank";
                $OldRank = "fleet_old_rank";
            break;
            case 3:
                $Order   = "tech_rank";
                $Points  = "tech_points";
                $Rank    = "tech_rank";
                $OldRank = "tech_old_rank";
            break;
            case 4:
                $Order   = "build_rank";
                $Points  = "build_points";
                $Rank    = "build_rank";
                $OldRank = "build_old_rank";
            break;
            case 5:
                $Order   = "defs_rank";
                $Points  = "defs_points";
                $Rank    = "defs_rank";
                $OldRank = "defs_old_rank";
            break;
            default:
                $Order   = "total_rank";
                $Points  = "total_points";
                $Rank    = "total_rank";
                $OldRank = "total_old_rank";
            break;
        }

        $RangeList  = array();

		$db 	= Database::get();
		$config	= Config::get();

        switch($who)
        {
            case 1:
                $countSql = 'SELECT COUNT(DISTINCT s.id_owner) AS state FROM %%STATPOINTS%% AS s
                    INNER JOIN %%USERS%% AS u ON u.id = s.id_owner
                    WHERE s.universe = :universe AND s.stat_type = 1';
                $countParams = array(':universe' => Universe::current());
                if ($config->stat == 2) {
                    $countSql .= ' AND u.authlevel < :authLevel';
                    $countParams[':authLevel'] = $config->stat_level;
                }
                $MaxUsers = $db->selectSingle($countSql, $countParams, 'state');
                $range		= max(1, min($range, $MaxUsers));
                $LastPage 	= max(1, ceil($MaxUsers / 100));

                for ($Page = 0; $Page < $LastPage; $Page++)
                {
                    $PageValue      				= ($Page * 100) + 1;
                    $PageRange      				= $PageValue + 99;
                    $Selector['range'][$PageValue] 	= $PageValue."-".$PageRange;
                }

                $start = max(floor(($range - 1) / 100) * 100, 0);

				if ($config->stat == 2) {
					$sql = "SELECT DISTINCT s.*, u.id, u.username, u.ally_id, a.ally_name FROM %%STATPOINTS%% as s
					INNER JOIN %%USERS%% as u ON u.id = s.id_owner
					LEFT JOIN %%ALLIANCE%% as a ON a.id = u.ally_id
					WHERE s.universe = :universe AND s.stat_type = 1 AND u.authlevel < :authLevel
					ORDER BY ".$Order." ASC LIMIT :offset, :limit;";
					$query = $db->select($sql, array(
						':universe'	=> Universe::current(),
						':authLevel'=> $config->stat_level,
						':offset'	=> $start,
						':limit'	=> 100,
					));
				} else {
					$sql = "SELECT DISTINCT s.*, u.id, u.username, u.ally_id, a.ally_name FROM %%STATPOINTS%% as s
					INNER JOIN %%USERS%% as u ON u.id = s.id_owner
					LEFT JOIN %%ALLIANCE%% as a ON a.id = u.ally_id
					WHERE s.universe = :universe AND s.stat_type = 1
					ORDER BY ".$Order." ASC LIMIT :offset, :limit;";
					$query = $db->select($sql, array(
						':universe'	=> Universe::current(),
						':offset'	=> $start,
						':limit'	=> 100,
					));
				}

				$RangeList	= array();

                foreach ($query as $StatRow)
                {
                    $RangeList[]	= array(
                        'id'		=> $StatRow['id'],
                        'name'		=> $StatRow['username'],
                        'points'	=> pretty_number($StatRow[$Points]),
                        'allyid'	=> $StatRow['ally_id'],
                        'rank'		=> $StatRow[$Rank],
                        'allyname'	=> $StatRow['ally_name'],
                        'ranking'	=> $StatRow[$OldRank] - $StatRow[$Rank],
                    );
                }

            break;
            case 2:
                $sql = 'SELECT COUNT(DISTINCT s.id_owner) AS state FROM %%STATPOINTS%% AS s
                    INNER JOIN %%ALLIANCE%% AS a ON a.id = s.id_owner
                    WHERE s.universe = :universe AND s.stat_type = 2';
				$MaxAllys = $db->selectSingle($sql, array(
					':universe'	=> Universe::current(),
				), 'state');

				$range		= max(1, min($range, $MaxAllys));
                $LastPage 	= max(1, ceil($MaxAllys / 100));
				
                for ($Page = 0; $Page < $LastPage; $Page++)
                {
                    $PageValue      				= ($Page * 100) + 1;
                    $PageRange      				= $PageValue + 99;
                    $Selector['range'][$PageValue] 	= $PageValue."-".$PageRange;
                }

                $start = max(floor(($range - 1) / 100) * 100, 0);

                $sql = 'SELECT DISTINCT s.*, a.id, a.ally_members, a.ally_name FROM %%STATPOINTS%% as s
                INNER JOIN %%ALLIANCE%% as a ON a.id = s.id_owner
                WHERE universe = :universe AND stat_type = 2
                ORDER BY '.$Order.' ASC LIMIT :offset, :limit;';
				$query = $db->select($sql, array(
					':universe'	=> Universe::current(),
					':offset'	=> $start,
					':limit'	=> 100,
				));

				foreach ($query as $StatRow)
                {
                    $RangeList[]	= array(
                        'id'		=> $StatRow['id'],
                        'name'		=> $StatRow['ally_name'],
                        'members'	=> $StatRow['ally_members'],
                        'rank'		=> $StatRow[$Rank],
                        'mppoints'	=> pretty_number($StatRow['ally_members'] > 0 ? floor($StatRow[$Points] / $StatRow['ally_members']) : 0),
                        'points'	=> pretty_number($StatRow[$Points]),
                        'ranking'	=> $StatRow[$OldRank] - $StatRow[$Rank],
                    );
                }

            break;
        }

        $Selector['who'] 	= array(1 => $LNG['st_player'], 2 => $LNG['st_alliance']);
        $Selector['type']	= array(1 => $LNG['st_points'], 2 => $LNG['st_fleets'], 3 => $LNG['st_researh'], 4 => $LNG['st_buildings'], 5 => $LNG['st_defenses']);


		require_once 'includes/classes/Cronjob.class.php';

        $this->assign(array(
            'Selectors'				=> $Selector,
            'who'					=> $who,
            'type'					=> $type,
            'range'					=> floor(($range - 1) / 100) * 100 + 1,
            'RangeList'				=> $RangeList,
            'CUser_ally'			=> $USER['ally_id'],
            'CUser_id'				=> $USER['id'],
            'stat_date'				=> _date($LNG['php_tdformat'], Cronjob::getLastExecutionTime('statistic'), $USER['timezone']),
        ));

        $this->display('page.statistics.default.tpl');
    }
}
