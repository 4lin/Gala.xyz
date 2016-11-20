{block name="title" prepend}{$LNG.lm_faq}{/block}
{block name="content"}
<table width="100%">
	<tr>
		<th style="text-align:center">{$LNG.faq_overview}</th>
	</tr>
	<tr>
		<th style="text-align:center">{$questionRow.title}</th>
	</tr>
	<tr>
		<td class="left">
		{$questionRow.body}
		</td>
	</tr>
	<tr><th style="text-align:center"><a href="game.php?page=questions">{$LNG.al_back}</a></th>
	</tr>
</table>
{/block}