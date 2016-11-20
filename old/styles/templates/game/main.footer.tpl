
<div class="clear"></div>
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
</div>
        <div id="siteFooter" class="clearfloat">
            <div class="fcontent">
                <div class="fleft textLeft">
                    <a href="game.php?page=changelog" title="Notas de versi&oacute;n">1.7.3</a>  <a href="http://www.2moons.cc" title="2Moons - Open Source Project" target="_blank">2Moons.cc</a> &copy; 2013
                </div>
                <div class="fright textRight">
					{if isModulAvalible($smarty.const.MODULE_BANLIST)}<a href="game.php?page=banList" target="_self"><font style="color:red;">{$LNG.lm_banned}</font></a>{/if} |
					{if isModulAvalible($smarty.const.MODULE_RECORDS)}<a href="game.php?page=records" target="_self"><font style="color:orange;">{$LNG.lm_records}</font></a>{/if} |
					{if isModulAvalible($smarty.const.MODULE_BATTLEHALL)}<a href="game.php?page=battleHall" target="_self"><font style="color:#6F9FC8;">{$LNG.lm_topkb}</font></a>{/if} |
                    <a href="game.php?page=questions" target="_self">{$LNG.lm_faq}</a> |
                    {if !empty($hasBoard)}<a href="game.php?page=board" target="forum">{$LNG.lm_forums}</a> |{/if}
					{if isModulAvalible($smarty.const.MODULE_SUPPORT)}<a href="game.php?page=ticket" target="_self">{$LNG.lm_support}</a> |{/if}
                    <a href="index.php?page=rules" target="rules">{$LNG.lm_rules}</a> |
                    <a href="index.php?page=disclamer" target="_blank">{$LNG.lm_disclamer}</a>
                </div>
                <br class="clearfloat" />
            </div>
       </div>

</body>
</html>