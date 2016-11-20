{block name="title" prepend}{$LNG.lm_options}{/block}
{block name="content"}
<div id="planet" style="background:url({$dpath}img/pagination/resources.jpg) no-repeat; height:250px; width:654px;">
	<h2>{$LNG.op_user_data}: {$username}</h2>
</div>

<div class="cs-left"></div>
<div class="cs-right"></div>

<link rel="stylesheet" href="http://codeorigin.jquery.com/ui/1.10.3/themes/ui-darkness/jquery-ui.css" />
<script>
$(function() {
$("#tabs").tabs();
$(document).on('click','input[type=text]',function(){ this.select(); });
});
</script>

<form action="game.php?page=settings" method="post">
<input type="hidden" name="mode" value="send">

<div id="tabs" style="border:1px;background:none repeat scroll 0% 0% rgb(13,16,20)">
	<ul style="height:auto;background-image:url('{$dpath}img/bkd_title.png');">
		{if $userAuthlevel > 0}
		<li><a href="#tabs-1">{$LNG.op_admin_title_options}</a></li>
		{/if}
		<li><a href="#tabs-2">{$LNG.op_user_data}</a></li>
		<li><a href="#tabs-3">{$LNG.op_general_settings}</a></li>
		<li><a href="#tabs-4">{$LNG.op_galaxy_settings}</a></li>
		<li><a href="#tabs-7">{if extension_loaded('gd') && isModulAvalible($smarty.const.MODULE_BANNER)}{$LNG.ov_userbanner}{/if}</a></li>
		<li><a href="#tabs-5">{$LNG.op_shortcut}</a></li>
		<li><a href="#tabs-6">{$LNG.op_vacation_delete_mode}</a></li>
	</ul>
	{if $userAuthlevel > 0}
	<div id="tabs-1">
	<table style="width:100%">
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_admin_planets_protection}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input id="c1" name="adminprotection" type="checkbox" value="1" {if $adminProtection > 0}checked="checked"{/if}><label for="c1"><span></span></label></td></tr>
	<tr><td style="height:20px;border:0px" colspan="3"></td></tr>
	<tr><td style="font-size:1.4em;border:0px" colspan="3"><input id="c2" class="button green" value="{$LNG.op_save_changes}" type="submit"><label for="c2"><span></span></label></td></tr>
	</table>
	</div>
	{/if}

	<div id="tabs-2">
	<table style="width:100%">
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_username}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right">{if $changeNickTime < 0}<input name="username" size="20" value="{$username}" type="text">{else}{$username}{/if}</td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_old_pass}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input name="password" size="20" type="password" class="autocomplete"></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_new_pass}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input name="newpassword" size="20" maxlength="40" type="password" class="autocomplete"></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_repeat_new_pass}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input name="newpassword2" size="20" maxlength="40" type="password" class="autocomplete"></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left"><span class="tooltip" data-tooltip-content="{$LNG.op_email_adress_descrip}">{$LNG.op_email_adress}</span></td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input name="email" maxlength="64" size="20" value="{$email}" type="text"></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_permanent_email_adress}</td><td style="width:240px;border:0px;text-align:right"><span style="font-size:1.4em;font-weight:bold;color:green">{$permaEmail}</td></tr>
	<tr><td style="height:20px;border:0px" colspan="3"></td></tr>
	<tr><td style="font-size:1.4em;border:0px" colspan="3"><input class="button green" value="{$LNG.op_save_changes}" type="submit"></td></tr>
	</table>
	</div>

	<div id="tabs-3">
	<table style="width:100%">
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_timezone}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><div class="styled-select">{html_options name=timezone options=$Selectors.timezones selected=$timezone}</div></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{if count($Selectors.lang) > 1}{$LNG.op_lang}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><div class="styled-select">{html_options name=language options=$Selectors.lang selected=$userLang}{/if}</div></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_sort_planets_by}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><div class="styled-select">{html_options name=planetSort options=$Selectors.Sort selected=$planetSort}</div></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_sort_kind}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><div class="styled-select">{html_options name=planetOrder options=$Selectors.SortUpDown selected=$planetOrder}</div></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{if count($Selectors.Skins) > 1}{$LNG.op_skin_example}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><div class="styled-select">{html_options options=$Selectors.Skins selected=$theme name="theme" id="theme"}{/if}</div></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_active_build_messages}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input id="c3" name="queueMessages" type="checkbox" value="1" {if $queueMessages == 1}checked="checked"{/if}><label for="c3"><span></span></label></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_active_spy_messages_mode}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input id="c4" name="spyMessagesMode" type="checkbox" value="1" {if $spyMessagesMode == 1}checked="checked"{/if}><label for="c4"><span></span></label></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_block_pm}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input id="c5" name="blockPM" type="checkbox" value="1" {if $blockPM == 1}checked="checked"{/if}><label for="c5"><span></span></label></td></tr>
	<tr><td style="height:20px;border:0px" colspan="3"></td></tr>
	<tr><td style="font-size:1.4em;border:0px" colspan="3"><input class="button green" value="{$LNG.op_save_changes}" type="submit"></td></tr>
	</table>
	</div>

	<div id="tabs-4">
	<table style="width:100%">
	<tr><td style="border:0px;font-size:1.4em;text-align:left"><span class="tooltip" data-tooltip-content="{$LNG.op_spy_probes_number_descrip}">{$LNG.op_spy_probes_number}</span></td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input name="spycount" size="{$spycount|count_characters + 3}" value="{$spycount}" type="int"></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left">{$LNG.op_max_fleets_messages}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input name="fleetactions" maxlength="2" size="{$fleetActions|count_characters + 2}" value="{$fleetActions}" type="int"></td></tr>
	<tr><td style="height:20px;border:0px" colspan="3"></td></tr>
	<tr><td style="font-size:1.4em;border:0px" colspan="3"><input class="button green" value="{$LNG.op_save_changes}" type="submit"></td></tr>
	</table>
	</div>

	<div id="tabs-5">
	<table style="width:100%">
	<tr><td style="border:0px;font-size:1.4em;text-align:left"><img src="{$dpath}img/e.gif" alt="">{$LNG.op_spy}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input id="c6" name="galaxySpy" type="checkbox" value="1" {if $galaxySpy == 1}checked="checked"{/if}><label for="c6"><span></span></label></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left"><img src="{$dpath}img/m.gif" alt="">{$LNG.op_write_message}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input id="c7" name="galaxyMessage" type="checkbox" value="1" {if $galaxyMessage == 1}checked="checked"{/if}><label for="c7"><span></span></label></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left"><img src="{$dpath}img/b.gif" alt="">{$LNG.op_add_to_buddy_list}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input id="c8" name="galaxyBuddyList" type="checkbox" value="1" {if $galaxyBuddyList == 1}checked="checked"{/if}><label for="c8"><span></span></label></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left"><img src="{$dpath}img/r.gif" alt="">{$LNG.op_missile_attack}</td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input id="c9" name="galaxyMissle" type="checkbox" value="1" {if $galaxyMissle == 1}checked="checked"{/if}><label for="c9"><span></span></label></td></tr>
	<tr><td style="height:20px;border:0px" colspan="3"></td></tr>
	<tr><td style="font-size:1.4em;border:0px" colspan="3"><input class="button green" value="{$LNG.op_save_changes}" type="submit"></td></tr>
	</table>
	</div>

	<div id="tabs-6">
	<table style="width:100%">
	<tr><td style="border:0px;font-size:1.4em;text-align:left"><span class="tooltip" data-tooltip-content="{$LNG.op_activate_vacation_mode_descrip}">{$LNG.op_activate_vacation_mode}</span></td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input id="c10" name="vacation" type="checkbox" value="1"><label for="c10"><span></span></label></td></tr>
	<tr><td style="border:0px;font-size:1.4em;text-align:left"><span class="tooltip" data-tooltip-content="{$LNG.op_dlte_account_descrip}">{$LNG.op_dlte_account}</span></td><td style="width:240px;font-size:1.4em;border:0px;text-align:right"><input id="c11" name="delete" type="checkbox" value="1" {if $delete > 0}checked="checked"{/if}><label for="c11"><span></span></label></td></tr>
	<tr><td style="height:20px;border:0px" colspan="3"></td></tr>
	<tr><td style="font-size:1.4em;border:0px" colspan="3"><input class="button green" value="{$LNG.op_save_changes}" type="submit"></td></tr>
	</table>
	</div>

	<div id="tabs-7">
	{if extension_loaded('gd') && isModulAvalible($smarty.const.MODULE_BANNER)}
	<table style="width:100%">
	<tr><td style="border:0px;text-align:center"><img src="userpic.php?id={$userID}" alt="" width="450" height="80" id="userpic"></td></tr>
	<tr><td style="border:0px;text-align:center">HTML:
	<tr><td style="border:0px;text-align:center"><input type="text" value='<a href="{$smarty.const.PROTOCOL}{$smarty.const.HTTP_HOST}{$smarty.const.HTTP_ROOT}{if $ref_active}index.php?ref={$userid}{/if}" onclick="this.select();"/><img src="{$smarty.const.PROTOCOL}{$smarty.const.HTTP_HOST}{$smarty.const.HTTP_ROOT}userpic.php?id={$userid}"></a>' readonly="readonly" style="width:450px"></td></tr>
	<tr><td style="border:0px;text-align:center">BBCode:</td>
	<tr><td style="border:0px;text-align:center"><input type="text" value="[url={$smarty.const.PROTOCOL}{$smarty.const.HTTP_HOST}{$smarty.const.HTTP_ROOT}{if $ref_active}index.php?ref={$userid}{/if}][img]{$smarty.const.PROTOCOL}{$smarty.const.HTTP_HOST}{$smarty.const.HTTP_ROOT}userpic.php?id={$userid}[/img][/url]" readonly="readonly" style="width:450px" onclick="this.select();"/></td></tr>
	</table>
	{/if}
	</div>
</div>
{/block}