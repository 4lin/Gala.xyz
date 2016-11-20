{block name="title" prepend}{$LNG.lm_buddylist}{/block}
{block name="content"}
<!--<div id="planet" style="background:url(./styles/theme/gow/img/pagination/top100.jpg) no-repeat; height:300px; width:654px;">
	<h2>{$LNG.bu_request_message} </h2>
</div>
<div class="c-left"></div>
<div class="c-right"></div>-->
<form name="buddy" id="buddy" action="game.php?page=buddyList&amp;mode=send&amp;ajax=1" method="post">
<input type="hidden" name="id" value="{$id}">
    <table style="width:670px">
	<tr style="height:20px;">
        <td>{$LNG.bu_player}</td>
        <td><input type="text" value="{$username} [{$galaxy}:{$system}:{$planet}]" size="40" readonly></td>
    </tr>
	<tr>
        <td>{$LNG.bu_request_text}(<span id="cntChars">0</span> / 5000 {$LNG.bu_characters})</td>
        <td><textarea name="text" id="text" cols="40" rows="10" size="100" onkeyup="$('#cntChars').text($(this).val().length);"></textarea></td>
    </tr>
	<tr>
        <td colspan="2"><input type="submit" value="{$LNG.bu_send}"></td>
	</tr>
</table>
</form>
{/block}