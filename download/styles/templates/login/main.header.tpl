<!DOCTYPE html>
<!--[if lt IE 7 ]> 
<html class="ie ie6 no-js" lang="{$lang|escape:'html'}"> 
<![endif]-->
<!--[if IE 7 ]>    
<html class="ie ie7 no-js" lang="{$lang|escape:'html'}"> 
<![endif]-->
<!--[if IE 8 ]>    
<html class="ie ie8 no-js" lang="{$lang|escape:'html'}"> 
<![endif]-->
<!--[if IE 9 ]>    
<html class="ie ie9 no-js" lang="{$lang|escape:'html'}"> 
<![endif]-->
<!--[if gt IE 9]><!-->
<html class=" no-js" lang="{$lang|escape:'html'}">
<!--<![endif]-->
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>{block name="title"} - {$gameName|escape:'html'}{/block}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="generator" content="FREE SPACE UNION - FSU {$VERSION}">
	<meta name="description" content="FREE SPACE UNION - FSU (2Moons based Browsergame powerd by https://github.com/jkroepke/2Moons/)">
	<meta name="keywords" content="Space, Strategy, Browsergame, 2Moons, Space, Private, Server, Speed">

	<link rel="shortcut icon" href="./favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="styles/resource/css/login/main.css?v={$REV}-site-review3">
	<link rel="stylesheet" type="text/css" href="styles/resource/css/base/jquery.fancybox.css?v={$REV}">
	<link rel="stylesheet" type="text/css" href="styles/resource/css/login/bgfade.css" />

	<!--[if lt IE 9]>
	<script src="scripts/base/html5.js"></script>
	<![endif]-->
	<script src="scripts/login/modernizr.custom.86080.js"></script>
	<script src="scripts/base/jquery.js?v=4.0.0"></script>
	<script src="scripts/base/jquery.cookie.js?v={$REV}-jq4"></script>
	<script src="scripts/base/jquery.fancybox.js?v={$REV}-jq4"></script>
	<script src="scripts/login/main.js?v={$REV}-site-review3"></script>

	<script>
		{if isset($code)}var loginError = {$code|json};{/if}
	</script>

	{block name="script"}{/block}	
<link rel="stylesheet" href="/styles/resource/css/base/notifications.css?v={$REV}-notice1">
<script>window.GalaNoticeLabels={ title:{$LNG.ui_notice_title|json},close:{$LNG.ui_notice_close|json},ok:{$LNG.ui_notice_ok|json},login:{$LNG.ui_notice_login|json} };</script>
<script src="/scripts/base/notifications.js?v={$REV}-notice2"></script>
</head>
<body id="{$smarty.get.page|default:'overview'|htmlspecialchars}" class="{$bodyclass|escape:'html'}">
		<div id="page">
			<div class="container">
			<!-- end main.header -->
