var resttime	= 0;
var time		= 0;
var endtime		= 0;
var interval	= 0;
var buildname	= "";

function Buildlist() {
	var rest	= resttime - (serverTime.getTime() - startTime) / 1000;
	if (time > 0) {
		var progress = Math.min(100, Math.max(0, 100 - Math.max(rest, 0) / time * 100));
		$('#progressbar').progressbar('value', progress);
		$('#progressbar .ui-progressbar-value').css('height', progress + '%');
		$('#progressbar')[0].style.setProperty('--construction-progress', progress + '%');
	}
	if (rest <= 0) {
		window.clearInterval(interval);
		$('#time').text(Ready);
		$('#command').remove();
		document.title	= Ready + ' - ' + Gamename;
		window.setTimeout(function() {
			window.location.href = 'game.php?page=research';
		}, 1000);
		return true;
	}
	document.title	= GetRestTimeFormat(rest) + ' - ' + buildname + ' - ' + Gamename;
	
	$('#time').text(GetRestTimeFormat(rest));
}

$(document).ready(function() {
	time		= $('#time').data('time');
	resttime	= $('#progressbar').data('time');
	endtime		= $('.timer:first').data('time');
	buildname	= $('.onlist:first').text();
	interval	= window.setInterval(Buildlist, 1000);
	if (time > 0) $('#progressbar').progressbar({value: 0});
	Buildlist();
});