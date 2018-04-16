	</div><!-- END box -->
</div><!-- END boxBG -->
</div><!-- END contentBoxBody -->
<div class="clear"></div>

<div id="siteFooter">
	<div class="content">
		<div class="fleft textLeft">
			<a href="game.php?page=changelog">{$LNG.lm_changelog}</a> | <a href="game.php?page=questions">{$LNG.lm_faq}</a> | 
			<a href="index.php?page=rules" target="rules">{$LNG.lm_rules}</a> | 
			{if isModuleAvailable($smarty.const.MODULE_BANLIST)}
			<a href="game.php?page=banList">{$LNG.lm_banned}</a>{/if} |
			{if isModuleAvailable($smarty.const.MODULE_NOTICE)}<a href="javascript:OpenPopup('?page=notes', 'notes', 720, 300);">{$LNG.lm_notes}</a>{/if} | {if !empty($hasBoard)}<a href="game.php?page=board" target="forum">{$LNG.lm_forums}</a>{/if} | 
			<a href="https://github.com/4lin/Galaxyz-rev0.01/releases" target="_blank" class="tooltip" title="Galaxyz GitHub Home Skin Project">Galaxyz.GitHub</a> 
		</div>

		<div class="fright textRight">
		</div>
	</div>
	
	{if $ga_active}
	<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', '{$ga_key}']);
	_gaq.push(['_trackPageview']);

	(function() {
	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();
	</script>
	{/if}
	{if $debug == 1}
	<script type="text/javascript">
	onerror = handleErr;
	</script>
	{/if}
</div><!-- END siteFooter -->

</body>
</html>