{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="planet" style="background: url({$dpath}img/pagination/alliance.jpg) no-repeat; height:300px; width:654px;">
<h2>{$LNG.al_alliance}</h2>
</div>
<div class="c-left"></div>
<div class="c-right"></div>
    <table style="width:670px;">
        <tr>
			<td style="width:50%"><a class="button black" href="game.php?page=alliance&amp;mode=create">{$LNG.al_alliance_make}</a></td>
			<td style="width:50%"><a class="button black" href="game.php?page=alliance&amp;mode=search">{$LNG.al_alliance_search}</a></td>
        </tr>
    </table>
{/block}