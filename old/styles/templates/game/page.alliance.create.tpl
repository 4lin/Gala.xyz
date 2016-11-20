{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="planet" style="background: url({$dpath}img/pagination/alliance.jpg) no-repeat; height:300px; width:654px;">
<h2>{$LNG.al_make_alliance}</h2>
</div>
<div class="c-left"></div>
<div class="c-right"></div>
<form action="game.php?page=alliance&amp;mode=create&amp;action=send" method="POST">
	<table style="width:670px;">
		<tr>
			<td>{$LNG.al_make_ally_tag_required}</td>
			<td><input type="text" name="atag" size="8" maxlength="8" value=""></td>
		</tr>
		<tr>
			<td>{$LNG.al_make_ally_name_required}</th>
			<td><input type="text" name="aname" size="20" maxlength="30" value=""></td>
		</tr>
		<tr>
			<td colspan="2"><input class="button green medium" type="submit" value="{$LNG.al_make_submit}"></td>
		</tr>
	</table>
</form>
{/block}