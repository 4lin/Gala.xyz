{block name="title" prepend}{$LNG.fcm_info}{/block}
{block name="content"}
<form id="redirect-post" action="{$url|escape:'html'}" method="post">
{foreach $postFields as $name => $value}
<input type="hidden" name="{$name|escape:'html'}" value="{$value|escape:'html'}">
{/foreach}
<table class="table519">
	<tr>
		<td><p>{$LNG.redirectPostMessage}</p></td>
	</tr>
</table>
</form>
<script>document.getElementById('redirect-post').submit();</script>
{/block}
