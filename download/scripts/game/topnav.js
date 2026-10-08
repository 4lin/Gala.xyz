//topnav.js
//RealTimeRessisanzeige for 2Moons
// @version 1.0
// @copyright 2010 by ShadoX

$(function () {
    var bar = document.getElementById('planet-message-bar');
    if (!bar) return;
    function updateBadges() {
        bar.querySelectorAll('.message-count').forEach(function (badge) {
            badge.classList.toggle('noMessage', Number(badge.textContent) <= 0);
        });
    }
    updateBadges();
    new MutationObserver(updateBadges).observe(bar, {childList: true, characterData: true, subtree: true});
});

function resourceTicker(config, init) {
	if(typeof init !== "undefined" && init === true)
		window.setInterval(function(){resourceTicker(config)}, 1000);
		
	var element	= $('#'+config.valueElem);
    if (init === true) element.data('resourceTicker', config);

	if(element.hasClass('res_current_max'))
	{
		return false;
	}
	
	var nrResource = Math.max(0, Math.floor(parseFloat(config.available) + parseFloat(config.production) / 3600 * (serverTime.getTime() - startTime) / 1000));
	var resourceName = config.valueElem.replace(/^current_/, '');
	var icon = $('#resourceTable img[data-resource-icon="' + resourceName + '"]');
	if (icon.length) {
		var summary = $('<div>').html(icon.attr('data-tooltip-content'));
		summary.find('[data-resource-current]').text(NumberGetHumanReadable(nrResource));
		var content = summary.html();
		icon.attr('data-tooltip-content', content);
		if ($.fn.tooltipster && icon.hasClass('tooltipstered')) {
			var tip = icon.tooltipster('instance');
			if (tip.status().open) tip.content(content);
		}
	}
	element.attr('data-real', nrResource).data('real', nrResource);
	
	if (nrResource < config.limit[1]) 
	{
		if (!element.hasClass('res_current_warn') && nrResource >= config.limit[1] * 0.9)
		{
			element.addClass('res_current_warn');
		}
		if(viewShortlyNumber) {
			element.attr('data-tooltip-content', '<span>' + NumberGetHumanReadable(nrResource) + '</span>');
			element.html(shortly_number(nrResource));
		} else {
			element.html(NumberGetHumanReadable(nrResource));
		}
	} else {
		element.addClass('res_current_max');
	}
}

function getRessource(name) {
	return parseInt($('#current_'+name).data('real'));
}
