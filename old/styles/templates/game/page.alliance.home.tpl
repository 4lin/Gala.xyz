{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="planet" style="background: url({$dpath}img/pagination/alliance.jpg) no-repeat; height:300px; width:654px;">
<h2>{$LNG.al_your_ally}</h2>
</div>
<div class="c-left"></div>
<div class="c-right"></div>

<link rel="stylesheet" href="http://codeorigin.jquery.com/ui/1.10.3/themes/ui-darkness/jquery-ui.css" />
<script>
$(function() {
$("#tabs").tabs();
$(document).on('click','input[type=text]',function(){ this.select(); });
});
</script>

<div id="tabs" style="border:1px;background:none repeat scroll 0% 0% rgb(13,16,20)">
	<ul style="height:auto;background-image:url('{$dpath}img/bkd_title.png');">
		<li><a href="#tabs-1">General</a></li>
		<li><a href="#tabs-2">{$LNG.al_events}</a></li>
		<li><a href="#tabs-3">{$LNG.al_inside_section}</a></li>
		<li><a href="#tabs-4">{$LNG.al_diplo}</a></li>
		<li><a href="#tabs-5">{$LNG.pl_fightstats}</a></li>
		<li><a nohref="nohref" onclick="return Dialog.AllianceChat();">{$LNG.al_goto_chat}</a></li>
		{if !$isOwner}<li><a href="#tabs-6">{$LNG.al_leave_alliance}</a></li>{/if}

		<!--<li>{if $rights.MEMBERLIST}<a href="?page=alliance&amp;mode=memberList">{$LNG.al_user_list}</a>{/if}</li>-->
	</ul>
	<div id="tabs-1">
<table style="width:100%">
	{if $ally_image}
	<tr>
		<td colspan="2"><img src="{$ally_image}"></td>
	</tr>
	{/if}
	<tr>
		<td style="width:50%">{$LNG.al_ally_info_tag}</td>
		<td style="width:50%">{$ally_tag}</td>
	</tr>
	<tr>
		<td>{$LNG.al_ally_info_name}</td>
		<td>{$ally_name}</td>
	</tr>
	<tr>
		<td>{$LNG.al_ally_info_members}</td>
		<td>{$ally_max_members} / {$ally_members}{if $rights.MEMBERLIST} <a class="button orange small" href="?page=alliance&amp;mode=memberList">{$LNG.al_user_list}</a>{/if}</td>
	</tr>
	<tr>
		<td>{$LNG.al_rank}</td>
		<td>{$rankName}{if $rights.ADMIN} <a class="button orange small" href="?page=alliance&amp;mode=admin">{$LNG.al_manage_alliance}</a>{/if}</td>
	</tr> 
	{if $rights.SEEAPPLY && $applyCount > 0}		
	<tr>
		<td>{$LNG.al_requests}</td><td><a href="?page=alliance&amp;mode=admin&amp;action=mangeApply">{$requests}</a></td>
	</tr>
	{/if}
	{if $rights.ROUNDMAIL}
	<tr>
		<td>{$LNG.al_circular_message}</td><td><a class="button orange small" href="game.php?page=alliance&mode=circular" onclick="return Dialog.open(this.href, 650, 300);">{$LNG.al_send_circular_message}</a></td>
	</tr>
	{/if}
	</table>
	</div>
	
	<div id="tabs-2">
	<table style="width:100%">
	{if $rights.EVENTS}
	<tr>
			<th colspan="2">{$LNG.al_events}</th>
		</tr>
		{if $ally_events}
			{foreach $ally_events as $member => $events}
				<tr>
					<td colspan="2">{$member}</td>
				</tr>
				{foreach $events as $index => $fleet}
				<tr>
					<td id="fleettime_{$index}" class="fleets" data-fleet-end-time="{$fleet.returntime}" data-fleet-time="{$fleet.resttime}">-</td>
					<td colspan="2">{$fleet.text}</td>
				</tr>
				{/foreach}
			{/foreach}
		{else}
			<tr>
				<td colspan="2">{$LNG.al_no_events}</td>
			</tr>
		{/if}
	{/if}
	<tr>
		<td colspan="2" style="height:100px;border:0" class="bbcode">{if $ally_description}{$ally_description}{else}{$LNG.al_description_message}{/if}</td>
	</tr>
	{if $ally_web}
	<tr>
		<td>{$LNG.al_web_text}</td>
		<td><a href="{$ally_web}">{$ally_web}</a></td>
	</tr>
	{/if}
	<tr>
	</table>
	</div>
	
	<div id="tabs-3">
	<table style="width:100%">
	<tr>
		<td colspan="2" style="height:100px;border:0" class="bbcode">{$ally_text}</td>
	</tr>
	</table>
	</div>
	
	<div id="tabs-4">
	<table style="width:100%">
	<tr>
		<th colspan="2">{$LNG.al_diplo}</th>
	</tr>
	<tr>
		<td colspan="2">
		{if $DiploInfo}
			{if !empty($DiploInfo.0)}<b><u>{$LNG.al_diplo_level.0}</u></b><br><br>{foreach item=PaktInfo from=$DiploInfo.0}<a href="?page=alliance&mode=info&amp;id={$PaktInfo.1}">{$PaktInfo.0}</a><br>{/foreach}<br>{/if}
		{if !empty($DiploInfo.1)}<b><u>{$LNG.al_diplo_level.1}</u></b><br><br>{foreach item=PaktInfo from=$DiploInfo.1}<a href="?page=alliance&mode=info&amp;id={$PaktInfo.1}">{$PaktInfo.0}</a><br>{/foreach}<br>{/if}
		{if !empty($DiploInfo.2)}<b><u>{$LNG.al_diplo_level.2}</u></b><br><br>{foreach item=PaktInfo from=$DiploInfo.2}<a href="?page=alliance&mode=info&amp;id={$PaktInfo.1}">{$PaktInfo.0}</a><br>{/foreach}<br>{/if}
		{if !empty($DiploInfo.3)}<b><u>{$LNG.al_diplo_level.3}</u></b><br><br>{foreach item=PaktInfo from=$DiploInfo.3}<a href="?page=alliance&mode=info&amp;id={$PaktInfo.1}">{$PaktInfo.0}</a><br>{/foreach}<br>{/if}
			{if !empty($DiploInfo.4)}<b><u>{$LNG.al_diplo_level.4}</u></b><br><br>{foreach item=PaktInfo from=$DiploInfo.4}<a href="?page=alliance&mode=info&amp;id={$PaktInfo.1}">{$PaktInfo.0}</a><br>{/foreach}<br>{/if}
		{else}
			N/A
		{/if}
		</td>
	</tr>
	</table>
	</div>
	
<div id="tabs-5">
	<table style="width:100%">
	<tr>
		<th colspan="2">{$LNG.pl_fightstats}</th>
	</tr>
	<tr>
		<td>{$LNG.pl_totalfight}</td><td>{$totalfight|number}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_fightwon}</td><td>{$fightwon|number} {if $totalfight}({round($fightwon / $totalfight * 100, 2)}%){/if}</td>
	</tr>
	<tr>	
		<td>{$LNG.pl_fightlose}</td><td>{$fightlose|number} {if $totalfight}({round($fightlose / $totalfight * 100, 2)}%){/if}</td>
	</tr>
	<tr>	
		<td>{$LNG.pl_fightdraw}</td><td>{$fightdraw|number} {if $totalfight}({round($fightdraw / $totalfight * 100, 2)}%){/if}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_unitsshot}</td><td>{$unitsshot}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_unitslose}</td><td>{$unitslose}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_dermetal}</td><td>{$dermetal}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_dercrystal}</td><td>{$dercrystal}</td>
	</tr>
</table>
</div>

{if !$isOwner}
	<div id="tabs-6">
<table style="width:100%">
	<tr>
		<td style="border:0"><label for="leave_ally">{$LNG.al_leave_alliance} <a href="game.php?page=alliance&amp;mode=close" onclick="return confirm('{$LNG.al_leave_ally}');"><button id="leave_ally" class="button medium red">{$LNG.al_continue}</button></a></label></td>
	</tr>
</table>
</div>
{/if}

<!--<div id="tabs-7">
</div>-->

{/block}

{block name="script" append}
<script src="scripts/base/jquery.tablesorter.js"></script>
<script>$(function() {
    $("#memberList").tablesorter({
		headers: { 
			0: { sorter: false } ,
			3: { sorter: false } 
		},
		debug: false
	}); 
});</script>
{/block}