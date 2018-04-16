<!DOCTYPE html>
<!--[if lt IE 7 ]> 
<html class="ie ie6 no-js" lang="en"> 
<![endif]-->
<!--[if IE 7 ]>    
<html class="ie ie7 no-js" lang="en"> 
<![endif]-->
<!--[if IE 8 ]>    
<html class="ie ie8 no-js" lang="en"> 
<![endif]-->
<!--[if IE 9 ]>    
<html class="ie ie9 no-js" lang="en"> 
<![endif]-->
<!--[if gt IE 9]><!-->
<html class=" no-js" lang="en">
<!--<![endif]-->
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>{block name="title"} - {$gameName}{/block}</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="generator" content="FREE SPACE UNION - FSU {$VERSION}">
	<meta name="description" content="FREE SPACE UNION - FSU (2Moons based Browsergame powerd by https://github.com/jkroepke/2Moons/)">
	<meta name="keywords" content="Space, Strategy, Browsergame, 2Moons, Space, Private, Server, Speed">

	<link rel="shortcut icon" href="./favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="styles/resource/css/login/main.css?v={$REV}">
	<link rel="stylesheet" type="text/css" href="styles/resource/css/base/jquery.fancybox.css?v={$REV}">
	<link rel="stylesheet" type="text/css" href="styles/resource/css/login/bgfade.css" />

	<!--[if lt IE 9]>
	<script src="scripts/base/html5.js"></script>
	<![endif]-->
	<script src="scripts/login/bgjquery.js"></script>
	<script src="scripts/login/modernizr.custom.86080.js"></script>
	<script src="scripts/base/jquery.js?v={$REV}"></script>
	<script src="scripts/base/jquery.cookie.js?v={$REV}"></script>
	<script src="scripts/base/jquery.fancybox.js?v={$REV}"></script>
	<script src="scripts/login/main.js"></script>

	<script>
		{if isset($code)}var loginError = {$code|json};{/if}
	</script>

	<script>
	$(window).load(function() {      //Do the code in the {}s when the window has loaded 
	$("#loadingImg").show("fast");
  	$("#loadingImg").fadeOut(4000);  //Fade out the #loader div
  	$("#page").hide();
  	$("#page").fadeIn(2000);
	});
	</script>

	{block name="script"}{/block}	
</head>
<body id="{$smarty.get.page|htmlspecialchars|default:'overview'}" class="{$bodyclass}">
	<div id="loadingImg">Loading page please wait...</div>
		<div id="page">
			<div class="container">
			<!-- end main.header -->