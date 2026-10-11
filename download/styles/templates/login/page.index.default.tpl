{block name="title" prepend}{$LNG.siteTitleIndex}{/block}
{block name="content"}
{if !empty($code)}<section class="gala-message-card" data-gala-login-notice role="alert"><h2>{$LNG.ui_notice_title}</h2><div class="gala-message-text">{$code|escape:'html'}</div><div class="gala-message-actions"><a class="gala-notice-button" href="index.php" target="_top">{$LNG.ui_notice_login}</a></div></section>{/if}
		<ul class="cb-slideshow">
            <li><span>{$LNG.ui_image} 01</span><div><h3>{$LNG.rand1} </h3></div></li>
            <li><span>{$LNG.ui_image} 02</span><div><h3>{$LNG.rand2} </h3></div></li>
            <li><span>{$LNG.ui_image} 03</span><div><h3>{$LNG.rand3} </h3></div></li>
            <li><span>{$LNG.ui_image} 04</span><div><h3>{$LNG.rand4} </h3></div></li>
            <li><span>{$LNG.ui_image} 05</span><div><h3>{$LNG.rand5} </h3></div></li>
            <li><span>{$LNG.ui_image} 06</span><div><h3>{$LNG.rand6} </h3></div></li>
		</ul>
<section>
	<h1>{$descHeader|escape:'html'}</h1>
	<p class="desc">{$descText}</p>
	<ul id="desc_list">{foreach $gameInformations as $info}<li>{$info|escape:'html'}</li>{/foreach}</ul>
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
						<input name="username" id="username" type="text" autocomplete="username">
					</div>
					<div class="row">
						<label for="password">{$LNG.loginPassword}</label>
						<input name="password" id="password" type="password" autocomplete="current-password">
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

{/block}