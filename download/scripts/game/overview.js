$(document).ready(function()
{
	window.setInterval(function() {
		$('.fleets').each(function() {
			var s		= $(this).data('fleet-time') - GalaClock.elapsed() / 1000;
			if(s <= 0) {
				$(this).text('-');
			} else {
				$(this).text(GetRestTimeFormat(s));
			}
		})
	}, 1000);
	
	function updateOverviewTimers() {
		$('.timer').each(function() {
			var end = Number($(this).attr('data-endtime'));
            var s = end > 0 ? (end * 1000 - GalaClock.now()) / 1000 : $(this).data('time') - GalaClock.elapsed() / 1000;
			var image = $(this).closest('.overview-construction-image');
			var duration = Number(image.data('duration'));
			if (duration > 0) {
				var progress = Math.min(100, Math.max(0, 100 - Math.max(s, 0) / duration * 100));
				image.find('.overview-construction-fill').css('height', progress + '%');
			}
			if(s <= 0) {
				window.location.href = "game.php?page=overview";
			} else {
				$(this).text(GetRestTimeFormat(s));
			}
		});
	}
	updateOverviewTimers();
	window.setInterval(updateOverviewTimers, 1000);
});