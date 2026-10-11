{include file="overall_header.tpl"}
{nocache}
<table><tr><th>{$LNG.ui_npc_title}</th></tr><tr><td>{$LNG.ui_npc_help}</td></tr></table>
{if $npcMessage}<p role="status">{$npcMessage|escape:'html'}</p>{/if}
{if $npcError}<p role="alert">{$npcError|escape:'html'}</p>{/if}
<form method="post" action="admin.php?page=editbots&amp;uni={$npcUniverse}">
<input type="hidden" name="token" value="{$npcToken|escape:'html'}"><input type="hidden" name="action" value="create">
<table><tr><th colspan="2">{$LNG.ui_npc_create}</th></tr>
<tr><td><label for="npcCount">{$LNG.ui_npc_count}</label></td><td><input id="npcCount" name="count" type="number" min="1" max="20" value="1" required></td></tr>
<tr><td><label for="npcBudget">{$LNG.ui_npc_budget}</label></td><td><input id="npcBudget" name="budget" type="number" min="10000" max="10000000" value="100000" required></td></tr>
<tr><td><label for="npcGalaxy">{$LNG.ui_npc_galaxy}</label></td><td><input id="npcGalaxy" name="galaxy" type="number" min="1" max="{$npcMaxGalaxy}" value="{$npcGalaxy}" required></td></tr>
<tr><td><label for="npcSystem">{$LNG.ui_npc_system}</label></td><td><input id="npcSystem" name="system" type="number" min="1" max="{$npcMaxSystem}" value="{$npcSystem}" required></td></tr>
<tr><td colspan="2"><button type="submit">{$LNG.ui_npc_create}</button></td></tr></table></form>
<table><tr><th>{$LNG.ui_npc_title}</th><th>{$LNG.ui_npc_budget}</th><th>{$LNG.ui_npc_status}</th><th>{$LNG.ui_npc_save}</th></tr>
{foreach $npcList as $bot}<tr><td>{$bot.username|escape:'html'}<br>[{$bot.galaxy}:{$bot.system}:{$bot.planet}]</td>
<td colspan="3"><form method="post" action="admin.php?page=editbots&amp;uni={$npcUniverse}">
<input type="hidden" name="token" value="{$npcToken|escape:'html'}"><input type="hidden" name="action" value="save"><input type="hidden" name="id" value="{$bot.owner_id}">
<input aria-label="{$LNG.ui_npc_budget|escape:'html'}" name="budget" type="number" min="10000" max="10000000" value="{$bot.daily_budget}" required>
<select aria-label="{$LNG.ui_npc_status|escape:'html'}" name="active"><option value="1"{if $bot.active} selected{/if}>{$LNG.ui_npc_active}</option><option value="0"{if !$bot.active} selected{/if}>{$LNG.ui_npc_paused}</option></select>
<button type="submit">{$LNG.ui_npc_save}</button></form></td></tr>
{foreachelse}<tr><td colspan="4">{$LNG.ui_npc_empty}</td></tr>{/foreach}</table>
{/nocache}
{include file="overall_footer.tpl"}
