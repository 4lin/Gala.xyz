{block name="title" prepend}{$LNG.lm_trader}{/block}
{block name="content"}
<div id="planet" style="background:url({$dpath}img/pagination/merchant.gif) no-repeat; height:250px; width:654px;">
	<h2>{$LNG.tr_call_trader_who_buys}</h2>
</div>
<div class="cs-left"></div>
<div class="cs-right"></div>
{if $requiredDarkMatter}<table style="width:670px;"><tr><td><span style="color:red;">{$requiredDarkMatter}</span></td></tr></table>{else}

<table style="width:670px;">
<tr>
	<td>
		<div id="traderContainer" class="centerContainer">
			<div class="outer">
				<div class="inner">
					{foreach $charge as $resourceID => $chageData}
					<div class="trader_col">
						{if !$requiredDarkMatter}<form action="game.php?page=trader" method="post">
						<input type="hidden" name="mode" value="trade">
						<input type="hidden" name="resource" value="{$resourceID}">
						<input type="image" id="trader_metal" src="{$dpath}images/{$resource.$resourceID}.gif" title="{$LNG.tech.$resourceID}" border="0" height="32" width="52"><br>
						<label for="trader_metal">{$LNG.tech.$resourceID}</label>
						</form>
						{else}<img src="{$dpath}images/{$resource.$resourceID}.gif" title="{$LNG.tech.$resourceID}" border="0" height="32" width="52" style="margin: 3px;"><br>{$LNG.tech.$resourceID}{/if}
					</div>
					{/foreach}
				</div>
			</div>
			<div class="clear"></div>
		</div>
		</div>
		<div>
<br />
			<p><span style="color:red">{$tr_cost_dm_trader}</span></p>
			<p>{$LNG.tr_exchange_quota}: <span style="color:green;font-weight:bold">{$charge.901.903}/{$charge.902.903}/{$charge.903.903}</span></p>
<br />
		</div>
	</td>
</tr>
</table>

{/if}
{/block}