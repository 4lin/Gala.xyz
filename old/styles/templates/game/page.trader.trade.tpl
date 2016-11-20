{block name="title" prepend}{$LNG.lm_trader}{/block}
{block name="content"}
<div id="planet" style="background:url({$dpath}img/pagination/merchant.gif) no-repeat; height:250px; width:654px;">
	<h2>{$LNG.tr_sell} {$LNG.tech.$tradeResourceID}</h2>
</div>
<form id="trader" action="" method="post">
	<input type="hidden" name="mode" value="send">
	<input type="hidden" name="resource" value="{$tradeResourceID}">
	<table style="width:670px">
	<tr>
		<td>{$LNG.tr_resource}</td>
		<td colspan="2">{$LNG.tr_amount}</td>
		<td>{$LNG.tr_quota_exchange}</td>
	</tr>
	<tr>
		<td>{$LNG.tech.$tradeResourceID}</td>
		<td colspan="2"><span id="ress">0</span></td>
		<td>1</td>
	</tr>
	{foreach $tradeResources as $tradeResource}
	<tr>
		<td><label for="resource{$tradeResource}">{$LNG.tech[$tradeResource]}</label></td>
		<td><input name="trade[{$tradeResource}]" id="resource{$tradeResource}" class="trade_input" type="text" value="0" size="30" data-resource="{$tradeResource}"></td>
		<td><span id="resource{$tradeResource}Shortly"></span></td>
		<td>{$charge[$tradeResource]}</td>
	</tr>
	{/foreach}
	<tr>
		<td colspan="4"><input class="button green" type="submit" value="{$LNG.tr_exchange}"></td>
	</tr>
	</table>
</form>
{/block}
{block name="script" append}
<script type="text/javascript">
var charge = {$charge|json};
</script>
{/block}