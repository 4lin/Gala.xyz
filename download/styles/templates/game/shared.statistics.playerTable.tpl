<tr>
	<th style="width:60px;">{$LNG.st_position}</th>
	<th>{$LNG.st_player}</th>
	<th>&nbsp;</th>
	<th>{$LNG.st_alliance}</th>
	<th>{$LNG.st_points}</th>
</tr>
{foreach name=RangeList item=RangeInfo from=$RangeList}
<tr>
	<td><a class="tooltip" data-tooltip-content="{capture name=gameTooltip19}{if $RangeInfo.ranking == 0}<span style='color:#87CEEB'>*</span>{elseif $RangeInfo.ranking < 0}<span style='color:red'>{$RangeInfo.ranking}</span>{elseif $RangeInfo.ranking > 0}<span style='color:green'>+{$RangeInfo.ranking}</span>{/if}{/capture}{$smarty.capture.gameTooltip19|escape:'html'}">{$RangeInfo.rank}</a></td>
	<td><a href="#" data-player-name="{$RangeInfo.name|escape:'html'}" onclick="return Dialog.Playercard({$RangeInfo.id}, this.getAttribute('data-player-name'));"{if $RangeInfo.id == $CUser_id} style="color:lime"{/if}>{$RangeInfo.name|escape:'html'}</a></td>
	<td>{if $RangeInfo.id != $CUser_id}<a href="#" onclick="return Dialog.PM({$RangeInfo.id});"><img src="{$dpath}img/m.gif" title="{$LNG.st_write_message}" alt="{$LNG.st_write_message}"></a>{/if}</td>
	<td>{if $RangeInfo.allyid != 0}<a href="game.php?page=alliance&amp;mode=info&amp;id={$RangeInfo.allyid}">{if $RangeInfo.allyid == $CUser_ally}<span style="color:#33CCFF">{$RangeInfo.allyname|escape:'html'}</span>{else}{$RangeInfo.allyname|escape:'html'}{/if}</a>{else}-{/if}</td>
	<td>{$RangeInfo.points}</td>
</tr>
{/foreach}