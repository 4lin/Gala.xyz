{block name="title" prepend}{$LNG.lm_playercard}{/block}
{block name="content"}
<section class="player-profile"><header class="profile-banner"><img src="{$dpath}planets/normaltempplanet01.jpg" alt="" width="76" height="76"><div><h1>{$name|escape:'html'}</h1><p>{$LNG.pl_total}: {$total_points} · {$LNG.pl_range}: {$total_rank}</p></div></header><table class="profile-details">
	<tr>
		<th colspan="3">{$LNG.pl_overview}</th>
		</tr>
	<tr>
		<td style="width:40%">{$LNG.pl_name}</td>
		<td colspan="2">{$name|escape:'html'}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_homeplanet}</td>
		<td colspan="2">{$homeplanet|escape:'html'} <a href="game.php?page=galaxy&amp;galaxy={$galaxy}&amp;system={$system}">[{$galaxy}:{$system}:{$planet}]</a></td>
	</tr>
	<tr>
		<td>{$LNG.pl_ally}</td>
		<td colspan="2">{if $allyname}<a href="game.php?page=alliance&amp;mode=info&amp;id={$allyid}">{$allyname|escape:'html'}</a>{else}-{/if}</td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<th>{$LNG.pl_points}</th>
		<th>{$LNG.pl_range}</th>
	</tr>
	<tr>
		<td>{$LNG.pl_builds}</td>
		<td>{$build_points}</td>
		<td>{$build_rank}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_tech}</td>
		<td>{$tech_points}</td>
		<td>{$tech_rank}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_fleet}</td>
		<td>{$fleet_points}</td>
		<td>{$fleet_rank}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_def}</td>
		<td>{$defs_points}</td>
		<td>{$defs_rank}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_total}</td>
		<td>{$total_points}</td>
		<td>{$total_rank}</td>
	</tr>
	<tr>
		<th colspan="3">{$LNG.pl_fightstats}</th>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>{$LNG.pl_fights}</td>
		<td>{$LNG.pl_fprocent}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_fightwon}</td>
		<td>{$wons}</td>
		<td>{$siegprozent} %</td>
	</tr>
	<tr>
		<td>{$LNG.pl_fightdraw}</td>
		<td>{$draws}</td>
		<td>{$drawsprozent} %</td>
	</tr>
	<tr>
		<td>{$LNG.pl_fightlose}</td>
		<td>{$loos}</td>
		<td>{$loosprozent} %</td>
	</tr>
	<tr>
		<td>{$LNG.pl_totalfight}</td>
		<td>{$totalfights}</td>
		<td>100 %</td>
	</tr>
	<tr>
		<th colspan="3">{$playerdestory}:</th>
	</tr>
	<tr>
		<td>{$LNG.pl_unitsshot}</td>
		<td colspan="2">{$desunits}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_unitslose}</td>
		<td colspan="2">{$lostunits}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_dermetal}</td>
		<td colspan="2">{$kbmetal}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_dercrystal}</td>
		<td colspan="2">{$kbcrystal}</td>
	</tr>
{if $id != $yourid}
	<tr>
		<th colspan="3">{$LNG.pl_etc}</th>
	</tr>
	<tr>
		<td><a href="#" onclick="return Dialog.Buddy({$id})">{$LNG.pl_buddy}</a></td><td colspan="2"><a href="#" onclick="return Dialog.PM({$id});" title="{$LNG.pl_message}">{$LNG.pl_message}</a></td>
	</tr>
{/if}
</table></section>
{/block}