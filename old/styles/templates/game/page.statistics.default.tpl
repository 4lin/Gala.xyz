{block name="title" prepend}{$LNG.lm_statistics}{/block}
{block name="content"}
<form name="stats" id="stats" method="post" action="">
		<table class="table519">
		<tr>
			<td width="50"><a href="game.php?page=statistics&who=1" class="tooltip" data-tooltip-content="{$LNG.st_player}" id="who" onchange="$('#stats').submit();"><div id="sts_pla" class="sts_pla"></div></a><p class="stats ellipsis">{$LNG.st_player}</p></td>
			<td width="50"><a href="game.php?page=statistics&who=2" class="tooltip" data-tooltip-content="{$LNG.st_alliance}" id="who" onchange="$('#stats').submit();"><div id="sts_alli" class="sts_alli"></div></a><p class="stats ellipsis">{$LNG.st_alliance}</p></td>
			<td width="50"><a href="game.php?page=statistics&type=2" class="tooltip" data-tooltip-content="{$LNG.st_defenses}" id="type" onchange="$('#stats').submit();"><div id="sts_def" class="sts_def"></div></a><p class="stats ellipsis">{$LNG.st_defenses}</p></td>
			<td width="50"><a href="game.php?page=statistics&type=3" class="tooltip" data-tooltip-content="{$LNG.lm_buildings}" id="type" onchange="$('#stats').submit();"><div id="sts_eco" class="sts_eco"></div></a><p class="stats ellipsis">{$LNG.lm_buildings}</p></td>
			<td width="50"><a href="game.php?page=statistics&type=4" class="tooltip" data-tooltip-content="{$LNG.st_researh}" id="type" onchange="$('#stats').submit();"><div id="sts_res" class="sts_res"></div></a><p class="stats ellipsis">{$LNG.st_researh}</p></td>
			<td width="50"><a href="game.php?page=statistics&type=5" class="tooltip" data-tooltip-content="{$LNG.st_fleets}" id="type" onchange="$('#stats').submit();"><div id="sts_tro" class="sts_tro"></div></a><p class="stats ellipsis">{$LNG.st_fleets}</p></td>
			<!--<td width="50"><a href="game.php?page=statistics&type=6" class="tooltip" data-tooltip-content="{$LNG.st_points}" id="type" onchange="$('#stats').submit();"><div id="sts_poi" class="sts_poi"></div></a><p class="stats ellipsis">{$LNG.st_points}</p></td>-->
			<td><select name="range" onChange="javascript:document.stats.submit()">{html_options options=$Selectors.range selected=$range}</select></td>
		</tr>
		</table>
</form>
<table class="table519">
{if $who == 1}
	{include file="shared.statistics.playerTable.tpl"}
{elseif $who == 2}
	{include file="shared.statistics.allianceTable.tpl"}
{/if}
<tr><td colspan="6">{$LNG.st_statistics} ({$LNG.st_updated}: {$stat_date})</td></tr>
</table>
{/block}