{block name="title" prepend}{$LNG.siteTitleIndex}{/block}
{block name="content"}
<section>
	<h1 class="opacityBlack"><span style="color:#0ff">&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;</span> <span style="color:rgb(255,215,0)">{$descHeader}</span> <span style="color:red">&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;</span></h1>
	<h2 class="opacityBlack">
		<table cellpadding='7' style='text-align:center;margin-left:auto;margin-right:auto'>
		{foreach $LNG.gameInformations as $info}
			<tr>
				<td>{$info}</td>
			</tr>
		{/foreach}
		</table>
	</h2>
	<h2 class="opacityBlack9">
		<table cellpadding='7' style='text-align:center;margin-left:auto;margin-right:auto'>
			<tr>
				<td>
				&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip; {$LNG.ov_admins_online} {foreach $AdminsOnline as $ID => $Name}{if !$Name@first}&nbsp;&bull;&nbsp;{/if}<span style="color:#f00">{$Name}</span>{foreachelse}<span style="color:#f00">0</span>{/foreach} &vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;&vellip;<br />
				</td>
			</tr>
			<tr>
				<td>
				<!--{$LNG.ov_player_online} {foreach $PlayerOnline as $ID => $Name}{if !$Name@first}&nbsp;&bull;&nbsp;{/if}<font style="color:#0fe">{$Name}</font>{foreachelse}<font style="color:#0fe">0</font>{/foreach}-->
				<!--<p class="desc">{$descText}</p>-->
				&vellip;&vellip;&vellip;&vellip;&vellip;&vellip; {$LNG.ov_player_online} <span style="color:#f00">{$user_info_online}</span> / <span style="color:#ffff00">{$user_info_all}</span> &vellip;&vellip;&vellip;&vellip;&vellip;&vellip;<br /> &vellip;&vellip;&vellip; {$LNG.ov_user_last_new}<span style="font-weight:bold;color:#0ff">{$user_info_new}</span> &vellip;&vellip;&vellip;
				</td>
			</tr>
		</table>
	</h2>
</section>
<section>
	<table class="contentbox">
		<tr class="contentbox-header">
			<td class="contentbox-header-left"></td><td class="contentbox-header-center"></td><td class="contentbox-header-right"></td>
		</tr>
		<tr class="contentbox-content">
			<td class="contentbox-content-left"></td><td class="contentbox-content-center">
				<h1>{$LNG.loginHeader}</h1>
				<form id="login" name="login" action="index.php?page=login" data-action="index.php?page=login" method="post">
					<div class="row">
						<label for="universe">{$LNG.universe}</label>
						<select name="uni" id="universe" class="changeAction">{html_options options=$universeSelect selected=$UNI}</select>
					</div>
					<div class="row">
						<label for="username">{$LNG.loginUsername}</label>
						<input name="username" id="username" type="text">
					</div>
					<div class="row">
						<label for="password">{$LNG.loginPassword}</label>
						<input name="password" id="password" type="password">
					</div>
					<div class="row">
						<input type="submit" value="{$LNG.loginButton}">
					</div>
				</form>
				{if $facebookEnable}<a href="#" data-href="index.php?page=externalAuth&method=facebook" class="fb_login"><img src="styles/resource/images/facebook/fb-connect-large.png" alt=""></a>{/if}<!-- http://b.static.ak.fbcdn.net/rsrc.php/zB6N8/hash/4li2k73z.gif -->
				<br><span class="small">{$loginInfo}</span>
			</td><td class="contentbox-content-right"></td>
		</tr>
		<tr class="contentbox-footer">
			<td class="contentbox-footer-left"></td><td class="contentbox-footer-center"></td><td class="contentbox-footer-right"></td>
		</tr>
	</table>
</section>
<section>
	<div class="button-box">
		<div class="button-box-inner">
			<div class="button-important">
				<a href="index.php?page=register">
					<span class="button-left"></span>
					<span class="button-center">{$LNG.buttonRegister}</span>
					<span class="button-right"></span>
				</a>
			</div>
		</div>
	</div>
	<div class="button-box">
		<div class="button-box-inner">
			{if $mailEnable} 
			<div class="button multi">
				<a href="index.php?page=lostPassword">
					<span class="button-left"></span>
					<span class="button-center">{$LNG.buttonLostPassword}</span>
					<span class="button-right"></span>
				</a>
			</div>
			<div class="button multi">
			{else}
			<div class="button">
			{/if}
				<a href="index.php?page=screens">
					<span class="button-left"></span>
					<span class="button-center">{$LNG.buttonScreenshot}</span>
					<span class="button-right"></span>
				</a>
			</div>
		</div>
	</div>
</section>
{/block}
{block name="script" append}
<script>{if $code}alert({$code|json});{/if}</script>
{/block}