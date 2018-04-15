<!DOCTYPE html>

<!--[if lt IE 7 ]> <html lang="{$lang}" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="{$lang}" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="{$lang}" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="{$lang}" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="{$lang}" class="no-js"> 
<!--<![endif]-->
<head>
	<title>{block name="title"} - {$uni_name} - {$game_name}{/block}</title>

		<script type='text/javascript' src='/scripts/game/inventory.js'></script>
			<script type="text/javascript">
				var inventoryObj;
			</script>
			
			<script type="text/javascript">
				$.holdReady(true);

				var s = setInterval(function() {
					if (typeof initEmpireEquipment === "function") {
						$.holdReady(false);
						clearInterval(s);
					}
				}, 1);
			</script>
				<script type='text/javascript' src='/scripts/game/navigation.js?v={$REV}'></script>

	<meta name="generator" content="Gala.xyz {$VERSION}">

	{if !empty($goto)}
	<meta http-equiv="refresh" content="{$gotoinsec};URL={$goto}">
	{/if}
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/styles/resource/css/base/boilerplate.css?v={$REV}">
	<link rel="stylesheet" type="text/css" href="/styles/resource/css/ingame/main.css?v={$REV}">
	<link rel="stylesheet" type="text/css" href="/styles/resource/css/base/jquery.css?v={$REV}">
	<link rel="stylesheet" type="text/css" href="/styles/resource/css/base/jquery.fancybox.css?v={$REV}">
	<link rel="stylesheet" type="text/css" href="/styles/resource/css/ingame/tooltipster.bundle.min.css" />
	<link rel="stylesheet" type="text/css" href="/styles/resource/css/ingame/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-punk.min.css" />
	<link rel="stylesheet" type="text/css" href="/styles/resource/css/base/validationEngine.jquery.css?v={$REV}">
	<link rel="stylesheet" type="text/css" href="{$dpath}formate.css?v={$REV}">
	<link rel="shortcut icon" href="./favicon.ico" type="image/x-icon">
	<script type="text/javascript">
	var ServerTimezoneOffset = {$Offset};
	var serverTime 	= new Date({$date.0}, {$date.1 - 1}, {$date.2}, {$date.3}, {$date.4}, {$date.5});
	var startTime	= serverTime.getTime();
	var localTime 	= serverTime;
	var localTS 	= startTime;
	var Gamename	= document.title;
	var Ready		= "{$LNG.ready}";
	var Skin		= "{$dpath}";
	var Lang		= "{$lang}";
	var head_info	= "{$LNG.fcm_info}";
	var auth		= {$authlevel|default:'0'};
	var days 		= {$LNG.week_day|json|default:'[]'} 
	var months 		= {$LNG.months|json|default:'[]'} ;
	var tdformat	= "{$LNG.js_tdformat}";
	var queryString	= "{$queryString|escape:'javascript'}";
	var isPlayerCardActive	= "{$isPlayerCardActive|json}";

	setInterval(function() {
		serverTime.setSeconds(serverTime.getSeconds()+1);
	}, 1000);
	</script>
	<script type="text/javascript" src="/scripts/base/jquery.js?v={$REV}"></script>
	<script type="text/javascript" src="/scripts/base/jquery.ui.js?v={$REV}"></script>
	<script type="text/javascript" src="/scripts/base/jquery.cookie.js?v={$REV}"></script>
	<script type="text/javascript" src="/scripts/base/jquery.fancybox.js?v={$REV}"></script>
	<script type="text/javascript" src="/scripts/base/jquery.validationEngine.js?v={$REV}"></script>
	<script type="text/javascript" src="/scripts/l18n/validationEngine/jquery.validationEngine-{$lang}.js?v={$REV}"></script>
	<script type="text/javascript" src="/scripts/game/base.js?v={$REV}"></script>
	<script type="text/javascript" src="/scripts/game/test.js?v={$REV}"></script>
	<script type="text/javascript" src="/styles/resource/js/tooltipster.bundle.min.js"></script>

	<script>
        $(document).ready(function() {
            $('.tooltip').tooltipster({
				animation: 'fade',
				theme: 'tooltipster-punk',
            	contentCloning: true
            });

			$('.destrucTip').tooltipster({
				contentAsHTML: true,
				interactive: true,
				contentCloning: true,
    			trigger: 'custom',
    			triggerOpen: {
        						mouseenter: true,
        						touchstart: true
    						},
    			triggerClose: {
        						click: true,
        						scroll: true,
        						tap: true
    						}
			});

			$('.interacTip').tooltipster({
				contentAsHTML: true,
				interactive: true,
				contentCloning: true
			});
        });
    </script>

	{foreach item=scriptname from=$scripts}
	<script type="text/javascript" src="./scripts/game/{$scriptname}.js?v={$REV}"></script>
	{/foreach}
	{block name="script"}{/block}
	<script type="text/javascript">
	$(function() {
		{$execscript}
	});
	</script>
</head>
<body id="{$smarty.get.page|htmlspecialchars|default:'overview'}" class="{$bodyclass}">
	