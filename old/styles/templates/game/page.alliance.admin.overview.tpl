{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="script" append}
<script type="text/javascript" src="scripts/base/tinymce/tiny_mce_gzip.js"></script>
<script type="text/javascript">
$(function() {
	tinyMCE_GZ.init({
		plugins : 'bbcode,fullscreen',
		themes : 'advanced',
		languages : '{$lang}',
		disk_cache : true,
		debug : false
	}, function() {
		tinyMCE.init({
			language : '{$lang}',
			script_url : 'scripts/base/tinymce/tiny_mce.js',
			theme : "advanced",
			mode : "textareas",
			plugins : "bbcode,fullscreen",
			theme_advanced_buttons1 : "bold,italic,underline,undo,redo,link,unlink,image,forecolor,styleselect,removeformat,cleanup,code,fullscreen",
			theme_advanced_buttons2 : "",
			theme_advanced_buttons3 : "",
			theme_advanced_toolbar_location : "bottom",
			theme_advanced_toolbar_align : "center",
			theme_advanced_styles : "Code=codeStyle;Quote=quoteStyle",
			content_css : "{$dpath}formate.css",
			entity_encoding : "raw",
			add_unload_trigger : false,
			remove_linebreaks : false,
			fullscreen_new_window : false,
			fullscreen_settings : {
				theme_advanced_path_location : "top"
			}
		});
	});
});
</script>
{/block}
{block name="content"}
<div id="planet" style="background: url({$dpath}img/pagination/alliance.jpg) no-repeat; height:300px; width:654px;">
<h2>{$LNG.al_manage_alliance}</h2>
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
		<li><a href="#tabs-1">{$LNG.al_texts}</a></li>
		<li><a href="#tabs-2">{$LNG.al_manage_options}</a></li>
		<li><a href="#tabs-3">{$LNG.al_manage_ranks}</a></li>
		<li><a href="#tabs-4">{$LNG.al_manage_members}</a></li>
		<li><a href="#tabs-5">{$LNG.al_manage_diplo}</a></li>
	</ul>
	<div id="tabs-1">
		<form action="game.php?page=alliance&mode=admin" method="post">
		<input type="hidden" name="textMode" value="{$textMode}">
		<input type="hidden" name="send" value="1">
		<table style="width:760px">
			<tr>
				<td><a href="game.php?page=alliance&amp;mode=admin&amp;textMode=external">{$LNG.al_outside_text}</a></td>
				<td><a href="game.php?page=alliance&amp;mode=admin&amp;textMode=internal">{$LNG.al_inside_text}</a></td>
				<td><a href="game.php?page=alliance&amp;mode=admin&amp;textMode=apply">{$LNG.al_request_text}</a></td>
			</tr>
			<tr>
				<td colspan="3">
					<textarea name="text" id="text" cols="70" rows="15" class="tinymce">{$text}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input class="button red medium" type="reset" value="{$LNG.al_circular_reset}"> 
					<input class="button green medium" type="submit" value="{$LNG.al_save}">
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div id="tabs-2">
		<form action="game.php?page=alliance&mode=admin" method="post">
		<input type="hidden" name="textMode" value="{$textMode}">
		<input type="hidden" name="send" value="1">
		<table>
			<tr>
				<td>{$LNG.al_tag}</td>
				<td><input type="text" name="ally_tag" value="{$ally_tag}" size="8" maxlength="8" required></td>
			</tr>
			<tr>
				<td>{$LNG.al_name}</td>
				<td><input type="text" name="ally_name" value="{$ally_name}" size="20" maxlength="30" required></td>
			</tr>
			<tr>
				<td>{$LNG.al_manage_founder_rank}</td>
				<td><input type="text" name="owner_range" value="{$ally_owner_range}" size="30"></td>
			</tr>
			<tr>
				<td>{$LNG.al_web_site}</td>
				<td><input type="text" name="web" value="{$ally_web}" size="70"></td>
			</tr>
			<tr>
				<td>{$LNG.al_manage_image}</td>
				<td><input type="text" name="image" value="{$ally_image}" size="70"></td>
			</tr>
			<tr>
				<td>{$LNG.al_view_stats}</td>
				<td>{html_options name=stats options=$YesNoSelector selected=$ally_stats_data}</td>
			</tr>
			<tr>
				<td>{$LNG.al_view_diplo}</td>
				<td>{html_options name=diplo options=$YesNoSelector selected=$ally_diplo_data}</td>
			</tr>
			<tr>
				<td>{$LNG.al_view_events}</td>
				<td>
					<select name="events[]" size="{$aviable_events|@count}" multiple>
						{foreach $aviable_events as $id => $mission}
							{foreach $ally_events as $selected_events}
								{if $selected_events == $id}
									{assign var=selected value=selected}
									{break}
								{else}
									{assign var=selected value=''}
								{/if}
							{/foreach}
							<option value="{$id}" {$selected}>{$mission}</option>
						{/foreach}
					</select>
				</td>
			</tr>
			<tr>
				<th colspan="2">{$LNG.al_manage_requests}</th>
			</tr>
			<tr>
				<td>{$LNG.al_manage_requests}</td>
				<td>{html_options name=request_notallow options=$RequestSelector selected=$ally_request_notallow}</td>
			</tr>
			<tr>
				<td>{$LNG.al_set_max_members}</td>
				<td>{$ally_members} / <input type="number" min="1" name="ally_max_members" value="{$ally_max_members}" size="8"></td>
    		</tr>
			<tr>
				<td>{$LNG.al_manage_request_min_points}</td>
				<td><input type="number" min="0" name="request_min_points" value="{$ally_request_min_points}" size="30"></td>
			</tr>
			<tr>
			<td colspan="3"><input class="button green medium" type="submit" value="{$LNG.al_save}"></td>
			</tr>
			</form>

		{if $AllianceOwner}
		<table>
			<tr>
				<td>{$LNG.al_disolve_alliance}</td>
				<td>
					<form action="game.php?page=alliance&amp;mode=admin&amp;action=close" method="post">
						<input type="submit" class="button red medium" value="{$LNG.al_continue}" onclick="return confirm('{$LNG.al_close_ally}');">
					</form>
				</td>
			</tr> 
			<tr>
				<td>{$LNG.al_transfer_alliance}</td>
				<td>
					<form action="game.php?page=alliance&amp;mode=admin&amp;action=transfer" method="post">
						<input type="submit" class="button orange medium" value="{$LNG.al_continue}">
					</form>
				</td>
			</tr>  
		</table>
		{/if}
		</div>
	<div id="tabs-3">
		<table><tr><td style="text-align:center;border:0"><a class="button medium green" href="game.php?page=alliance&amp;mode=admin&amp;action=permissions">{$LNG.al_manage_ranks}</a></td></tr></table>
	</div>
	<div id="tabs-4">
		<table><tr><td style="text-align:center;border:0"><a class="button medium green" href="game.php?page=alliance&amp;mode=admin&amp;action=members">{$LNG.al_manage_members}</a></td></tr></table>
	</div>
	<div id="tabs-5">
		<table><tr><td style="text-align:center;border:0"><a class="button medium green" href="game.php?page=alliance&amp;mode=admin&amp;action=diplomacy">{$LNG.al_manage_diplo}</a></td></tr></table>
	</div>
</div>
{/block}