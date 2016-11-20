{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="planet" style="background: url({$dpath}img/pagination/alliance.jpg) no-repeat; height:300px; width:654px;">
<h2>{$LNG.al_find_alliances}</h2>
</div>
<div class="c-left"></div>
<div class="c-right"></div>
<form action="game.php?page=alliance&amp;mode=search" method="post">
	<table style="width:670px">
		<tr>
			<td>{$LNG.al_find_text}</td>
			<td><input type="text" name="searchtext" value="{$searchText}"> <input type="submit" class="button green medium" value="{$LNG.al_find_submit}"></td>
		</tr>
	</table>
</form>
{if !empty($searchList)}
<table class="table519">
	<tr>
		<th>{$LNG.al_ally_info_tag}</th>
		<th>{$LNG.al_ally_info_name}</th>
		<th>{$LNG.al_ally_info_members}</th>
	</tr>
	{foreach $searchList as $seachRow}
	<tr>
		<td><a href="game.php?page=alliance&amp;mode=apply&amp;id={$seachRow.id}">{$seachRow.tag}</a></td>
		<td><a href="game.php?page=alliance&amp;mode=apply&amp;id={$seachRow.id}">{$seachRow.name}</a></td>
		<td><a href="game.php?page=alliance&amp;mode=apply&amp;id={$seachRow.id}">{$seachRow.members}</a></td>
	</tr>
	{foreachelse}
	<tr>
		<td colspan="3">{$LNG.al_find_no_alliances}</td>
	</tr>
	{/foreach}
</table>
{/if}
{/block}