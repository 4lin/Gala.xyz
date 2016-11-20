{block name="title" prepend}{$LNG.lm_faq}{/block}
{block name="content"}
<table width="670">
	<tr>
	<th style="text-align:center">{$LNG.faq_overview}</th>
	</tr>
	<tr>
		<td class="left">
			{foreach $LNG.questions as $categoryID => $categoryRow}<h2 class="faq gray">{$categoryRow.category}</h2>
			<ul style="list-style:none outside none">
				{foreach $categoryRow as $questionID => $questionRow}
				{if is_numeric($questionID)}
				<li class="faq black small"><a href="game.php?page=questions&amp;mode=single&amp;categoryID={$categoryID}&amp;questionID={$questionID}">{$questionRow.title}</a></li>
				{/if}
				{/foreach}
			</ul>
			{/foreach}
		</td>
	</tr>
</table>
	{*{foreach $LNG.questions as $categoryID => $categoryRow}
	<tr>
		<th>{$categoryRow.category}</th>
	</tr>
	{foreach $categoryRow as $questionID => $questionRow}
	{if is_numeric($questionID)}
	<tr>
		<th>{$questionRow.title}</th>
	</tr>
	<tr>
		<td class="left">
		{$questionRow.body}
	</tr>
	{/if}
	{/foreach}
	{/foreach}*}
{/block}