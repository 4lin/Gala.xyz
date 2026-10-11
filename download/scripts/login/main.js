$(function() {
	var music = document.getElementById('background-music');
	var soundToggle = document.getElementById('background-sound-toggle');
	if (music && soundToggle) {
		var muteKey = 'gala-login-sound-muted';
		try { music.muted = localStorage.getItem(muteKey) === 'true'; } catch (error) {}
		function syncSoundToggle() {
			var audible = !music.muted && !music.paused;
			var label = soundToggle.getAttribute(audible ? 'data-mute-label' : 'data-enable-label');
			soundToggle.classList.toggle('is-silent', !audible);
			soundToggle.setAttribute('aria-pressed', String(audible));
			soundToggle.setAttribute('aria-label', label);
			soundToggle.setAttribute('title', label);
		}
		function rememberMute() {
			try { localStorage.setItem(muteKey, String(music.muted)); } catch (error) {}
		}
		soundToggle.addEventListener('click', function() {
			if (!music.muted && !music.paused) {
				music.muted = true;
			} else {
				music.muted = false;
				var playback = music.play();
				if (playback && playback.catch) playback.catch(syncSoundToggle);
			}
			rememberMute();
			syncSoundToggle();
		});
		['playing', 'pause', 'volumechange', 'error'].forEach(function(event) {
			music.addEventListener(event, syncSoundToggle);
		});
		soundToggle.hidden = false;
		syncSoundToggle();
	}
	$('.flags').on('click', function(e) {
		e.preventDefault();
		var langKey = $(this).closest('a').attr('hreflang');
		Login.setLanguage(langKey);
		return false;
	});
	
	$('.fancybox').fancybox({
		'type' : 'iframe',
		'padding' : 1,
	});
	
	if(LoginConfig.isMultiUniverse)
	{
		$('.changeAction')
		.each(function() {
			updateUrls($(this));
		})
		.on('change', function() {
			updateUrls($(this));
		});
		
		// $('.changeUni').on('change', function() {
		// 	document.location.href = LoginConfig.basePath+'uni'+$(this).val()+'/index.php'+document.location.search;
		// });
	}
	else
	{
		$('.fb_login').attr('href', function(i, old) {
			return LoginConfig.basePath+$(this).data('href');
		});
	}
});

var updateUrls = function(that, universe) {
	if (typeof universe === 'undefined') universe = that.val();
	if (LoginConfig.unisWildcast) {
		var basePathWithSubdomain = LoginConfig.basePath.replace('://', '://uni' + universe + '.');
		that.parents('form').attr('action', function(i, old) {
			return basePathWithSubdomain+$(this).data('action');
		});
		$('.fb_login').attr('href', function(i, old) {
			return basePathWithSubdomain+$(this).data('href');
		});
	} else {
		that.parents('form').attr('action', function(i, old) {
			return LoginConfig.basePath+'uni'+universe+'/'+$(this).data('action');
		});
		$('.fb_login').attr('href', function(i, old) {
			return LoginConfig.basePath+'uni'+universe+'/'+$(this).data('href');
		});
	}
}

var Login = {
	setLanguage : function (LNG, Query) {
		$.cookie('lang', LNG, {path: '/'});
		if(typeof Query === "undefined")
			document.location.href = document.location.href
		else
			document.location.href = document.location.href+Query;
	}
};
