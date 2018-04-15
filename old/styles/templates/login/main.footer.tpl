	<!--<embed src="/audio/space_music_mix1.mp3" width="1" height="1" loop="false" autostart="false" hidden="true"/>-->
	<audio class="xpos" controls loop autoplay>
		<p>
			If you are reading this, it is because your browser does not support the audio element. <br />
			Your browser is to old and dont understand the new and simple audio tag format used in new browsers. <br />
			You can check this link for non implemented solution that you may add, <br />
			http://www.html5tutorial.info/html5-audio.php <br />
		</p>
		<source src="/audio/space_music_mix1.mp3" type="audio/mpeg"/>
	</audio>
<footer>
	<a href="index.php?page=disclamer">{$LNG.menu_disclamer}</a> | Powered by <a href="http://2moons.cc" title="2Moons" target="_blank">2Moons</a> &copy; 2009-2017
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