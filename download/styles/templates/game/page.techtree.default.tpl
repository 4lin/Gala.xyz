{block name="title" prepend}{$LNG.lm_technology}{/block}
{block name="content"}
<table>
{foreach $TechTreeList as $elementID => $requireList}
{if !is_array($requireList)}
<thead>
<tr>
	<th colspan="2">{$LNG.tech.$requireList}</th>
	<th>{$LNG.tt_requirements}</th>
</tr>
</thead>
{else}
<tbody>
<tr>
	<td><a href="#" onclick="return Dialog.info({$elementID})"><img src="{$dpath}buildings/techtree/{$elementID}.{if $elementID >=600 && $elementID <= 699}jpg{else}png{/if}" width="25" height="25"></a></td>
	<td><a href="#" onclick="return Dialog.info({$elementID})">{$LNG.tech.$elementID}</a></td>
	<td>
	{if $requireList}
		{foreach $requireList as $requireID => $NeedLevel}
			<a href="#" onclick="return Dialog.info({$elementID})"><span style="color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};">{$LNG.tech.$requireID} ({$LNG.tt_lvl} {min($NeedLevel.count, $NeedLevel.own)}/{$NeedLevel.count})</span></a>{if !$NeedLevel@last}<br>{/if}
		{/foreach}
	{/if}
	</td>
</tr>
</tbody>
{/if}
{/foreach}
<tfoot>
</tfoot>
</table>
{/block}