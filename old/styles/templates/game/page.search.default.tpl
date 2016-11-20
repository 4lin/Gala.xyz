{block name="title" prepend}{$LNG.lm_search}{/block}
{block name="content"}
<div id="planet" style="background:url({$dpath}img/pagination/search.jpg) no-repeat; height:250px; width:654px;">
	<h2>{$LNG.sh_search_in_the_universe}<span id="loading" style="display:none;"> {$LNG.sh_loading}</span></h2>
</div>
<div class="cs-left"></div>
<div class="cs-right"></div>
<div id="content" style="padding:0px">
<table style="width:670px">
	<tr>
		<td>
			{html_options options=$modeSelector name="type" id="type"}
			<input type="text" name="searchtext" id="searchtext">
			<input class="btn_blue" type="button" value="{$LNG.sh_search}">
		</td>
	</tr>
</table>
</div>
{/block}