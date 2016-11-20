<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="{$lang}" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="{$lang}" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="{$lang}" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="{$lang}" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="{$lang}" class="no-js"> <!--<![endif]-->
<head>
	<link rel="stylesheet" type="text/css" href="styles/resource/css/login/main.css?v={$REV}">
	<link rel="stylesheet" type="text/css" href="styles/resource/css/base/jquery.fancybox.css?v={$REV}">
	<link rel="shortcut icon" href="./favicon.ico" type="image/x-icon">
	<title>{block name="title"} - {$gameName}{/block}</title>
	<meta name="generator" content="{$gameName} {$VERSION}">
	<!-- 
		This website is powered by 2Moons {$VERSION}
		2Moons is a free Space Browsergame initially created by Jan Kröpke and licensed under GNU/GPL.
		2Moons is copyright 2009-2013 of Jan Kröpke. Extensions are copyright of their respective owners.
		Information and contribution at http://2moons.cc/
	-->
	<meta name="keywords" content="{$gameName} Browsergame, 2Moons, Space, Strategy, Strategy Game, Private, Galaxy, Server, Speed">
	<meta name="description" content="{$gameName} Browsergame powered by http://2moons.cc/"> <!-- Noob Check :) -->
	<!--[if lt IE 9]>
	<script src="scripts/base/html5.js"></script>
	<![endif]-->
	<script src="scripts/base/jquery.js?v={$REV}"></script>
	<script src="scripts/base/jquery.cookie.js?v={$REV}"></script>
	<script src="scripts/base/jquery.fancybox.js?v={$REV}"></script>
	<script src="scripts/login/main.js"></script>
	{literal}
	<script type="text/javascript">

	function thebackground() {
	$('div.background img').css({opacity: 0.0});
	$('div.background img:first').css({opacity: 1.0});
	setInterval('change()',6000);
	}

	function change() {
	var current = ($('div.background img.show')? $('div.background img.show') : $('div.background img:first'));
	if ( current.length == 0 ) current = $('div.background img:first');
	var next = ((current.next().length) ? ((current.next().hasClass('show')) ? $('div.background img:first') :current.next()) : $('div.background img:first'));
	next.css({opacity: 0.0})
	.addClass('show')
	.animate({opacity: 1.0}, 1000);
	current.animate({opacity: 0.0}, 1000)
	.removeClass('show');
	};

	$(document).ready(function() {
	thebackground();	
	$('div.background').fadeIn(1000); // works for all the browsers other than IE
	$('div.background img').fadeIn(1000); // IE tweak
	});

	</script>
	{/literal}
	{block name="script"}{/block}
</head>
<body id="{$smarty.get.page|htmlspecialchars|default:'overview'}" class="{$bodyclass}">
	<div class="background">
	 <img src="./../uni1/styles/resource/css/login/slide/bg.jpg" alt="pic" />
	 <img src="./../uni1/styles/resource/css/login/slide/bg1.jpg" alt="pic1" />
	 <img src="./../uni1/styles/resource/css/login/slide/bg2.jpg" alt="pic2" />
	 <img src="./../uni1/styles/resource/css/login/slide/bg3.jpg" alt="pic3" />
	 <img src="./../uni1/styles/resource/css/login/slide/bg4.jpg" alt="pic4" />
	</div>
	<div id="page">
