{block name="title" prepend}{$LNG.siteTitleRegister}{/block}
{block name="content"}
<div id="registerFormWrapper">

<form id="registerForm" method="post" action="index.php?page=register" data-action="index.php?page=register" data-password-mismatch="{$LNG.registerErrorPasswordSame|escape:'html'}" data-email-mismatch="{$LNG.registerErrorMailSame|escape:'html'}">
<input type="hidden" value="send" name="mode">
<input type="hidden" name="registrationForm" value="{$registrationForm.id|escape:'html'}">
<input type="hidden" name="registrationToken" value="{$registrationForm.token|escape:'html'}">
<div class="registration-honeypot" aria-hidden="true"><label for="website">Website</label><input type="text" id="website" name="website" tabindex="-1" autocomplete="off"></div>
<input type="hidden" value="{$externalAuth.account}" name="externalAuth[account]">
<input type="hidden" value="{$externalAuth.method}" name="externalAuth[method]">
<input type="hidden" value="{$referralData.id}" name="referralID">
	<div class="rowForm">
		<label for="universe">{$LNG.universe}</label>
		<select name="uni" id="universe" class="changeAction">{html_options options=$universeSelect selected=$UNI}</select>
		{if !empty($error.uni)}<span class="error errorUni"></span>{/if}
	</div>
	{if !empty($externalAuth.account)}
	{if $facebookEnable}
	<div class="rowForm">
		<label>{$LNG.registerFacebookAccount}</label>
		<span class="text fbname">{$accountName|escape:'html'}</span>
	</div>
	{/if}
	{elseif empty($referralData.id)}
	{if $facebookEnable}
	<div class="rowForm">
		<label>{$LNG.registerFacebookAccount}</label>
		<a href="#" data-href="index.php?page=externalAuth&method=facebook" class="fb_login"><img src="styles/resource/images/facebook/fb-connect-large.png" alt=""></a>
	</div>
	{/if}
	{/if}
	<div class="rowForm">
		<label for="username">{$LNG.registerUsername}</label>
		<input type="text" class="input" name="username" id="username" minlength="3" maxlength="32" autocomplete="username" required>
		{if !empty($error.username)}<span class="error errorUsername"></span>{/if}
		<span class="inputDesc">{$LNG.registerUsernameDesc}</span>
	</div>
	<div class="rowForm">
		<label for="password">{$LNG.registerPassword}</label>
		<input type="password" class="input" name="password" id="password" minlength="8" maxlength="128" autocomplete="new-password" required>
		{if !empty($error.password)}<span class="error errorPassword"></span>{/if}
		<span class="inputDesc">{$LNG.registerPasswordDesc}</span>
	</div>
	<div class="rowForm">
		<label for="passwordReplay">{$LNG.registerPasswordReplay}</label>
		<input type="password" class="input" name="passwordReplay" id="passwordReplay" minlength="8" maxlength="128" autocomplete="new-password" required>
		{if !empty($error.passwordReplay)}<span class="error errorPasswordReplay"></span>{/if}
		<span class="inputDesc">{$LNG.registerPasswordReplayDesc}</span>
	</div>
	<div class="rowForm">
		<label for="email">{$LNG.registerEmail}</label>
		<input type="email" class="input" name="email" id="email" autocomplete="email" required>
		{if !empty($error.email)}<span class="error errorEmail"></span>{/if}
		<span class="inputDesc">{$LNG.registerEmailDesc}</span>
	</div>
	<div class="rowForm">
		<label for="emailReplay">{$LNG.registerEmailReplay}</label>
		<input type="email" class="input" name="emailReplay" id="emailReplay" autocomplete="email" required>
		{if !empty($error.emailReplay)}<span class="error errorEmailReplay"></span>{/if}
		<span class="inputDesc">{$LNG.registerEmailReplayDesc}</span>
	</div>
	{if count($languages) > 1}
	<div class="rowForm">
		<label for="language">{$LNG.registerLanguage}</label>
		<select name="lang" id="language">{html_options options=$languages selected=$lang}</select>
		{if !empty($error.language)}<span class="error errorLanguage"></span>{/if}
		<div class="clear"></div>
	</div>
	{/if}
	{if !empty($referralData.name)}
	<div class="rowForm">
		<label>{$LNG.registerReferral}</label>
		<span class="text">{$referralData.name|escape:'html'}</span>
		{if !empty($error.language)}<span class="error errorLanguage"></span>{/if}
		<div class="clear"></div>
	</div>
	{/if}
	    <div class="rowForm" id="captchaRow">
        {if $captchaProvider == 'turnstile'}
        <div class="cf-turnstile" data-sitekey="{$captchaSiteKey|escape:'html'}" data-action="register" data-language="{$lang|escape:'html'}" data-theme="dark"></div>
        {elseif $captchaProvider == 'recaptcha'}
        <div class="g-recaptcha" data-sitekey="{$captchaSiteKey|escape:'html'}"></div>
        {else}
        <label for="captchaAnswer">{$LNG.registerCaptcha}</label>
        <div class="local-captcha">
            <img id="registrationCaptcha" src="index.php?page=register&amp;mode=captcha&amp;form={$registrationForm.id|escape:'html'}" data-src="index.php?page=register&amp;mode=captcha&amp;form={$registrationForm.id|escape:'html'}" width="200" height="64" alt="{$LNG.ui_captcha_image|escape:'html'}">
            <button type="button" id="refreshCaptcha">{$LNG.ui_captcha_refresh}</button>
            <input type="text" id="captchaAnswer" name="captchaAnswer" maxlength="6" autocomplete="off" autocapitalize="characters" spellcheck="false" required aria-describedby="captchaHelp">
            <span class="inputDesc" id="captchaHelp">{$LNG.ui_captcha_help}</span>
        </div>
        {/if}
    </div>
	<div class="rowForm">
		<label for="rules">{$LNG.registerRules}</label>
		<input type="checkbox" name="rules" id="rules" value="1" required>
		{if !empty($error.rules)}<span class="error errorRules"></span>{/if}
		<span class="inputDesc">{$registerRulesDesc}</span>
	</div>
	<div class="rowForm">
		<input type="submit" class="submitButton" value="{$LNG.buttonRegister}">
	</div>
</form>
</div>
{/block}
{block name="script" append}
<link rel="stylesheet" type="text/css" href="styles/resource/css/login/register.css?v={$REV}-security">
{if $captchaProvider == 'turnstile'}
<script src="https://challenges.cloudflare.com/turnstile/v0/api.js" async defer></script>
{elseif $captchaProvider == 'recaptcha'}
<script type="text/javascript" src="https://www.google.com/recaptcha/api.js?hl={$lang}"></script>
{/if}
<script type="text/javascript" src="scripts/login/register.js?v={$REV}-security"></script>
{/block}