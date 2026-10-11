<footer>
	<a href="index.php?page=disclamer">{$LNG.menu_disclamer}</a> | Powered by (<a href="https://github.com/4lin/Gala.xyz/releases" title="Gala.xyz" target="_blank" rel="noopener noreferrer">Gala.xyz</a>) &copy; {nocache}{$copyrightYear}{/nocache}
</footer>
</div>
</div>
<div id="dialog" style="display:none;"></div>
<script>
var LoginConfig = {
    'isMultiUniverse': {$isMultiUniverse|json},
	'unisWildcast': {$unisWildcast|json},
	'referralEnable' : {$referralEnable|json},
	'basePath' : {$basepath|json}
};
</script>
{if $analyticsEnable}
<script type="text/javascript" src="http://www.google-analytics.com/ga.js"></script>
<script type="text/javascript">
try{
var pageTracker = _gat._getTracker("{$analyticsUID}");
pageTracker._trackPageview();
} catch(err) {}</script>
{/if}

</body>
</html>
