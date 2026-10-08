function toggleReferralPanel(event)
{
    if (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
    }
    var panel = document.getElementById('overviewReferralPanel');
    var toggle = document.querySelector('.referral-toggle');
    if (!panel) return false;
    panel.hidden = !panel.hidden;
    if (toggle) toggle.setAttribute('aria-expanded', panel.hidden ? 'false' : 'true');
    if (!panel.hidden) {
        var input = panel.querySelector('input');
        if (input) { input.focus(); input.select(); }
    }
    return false;
}

$(document).ready(function()
{
    var details = document.querySelector('#overviewOv #planetDetails');
    if (details && !window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
        var fields = [];
        details.querySelectorAll('td > span').forEach(function (field) {
            var walker = document.createTreeWalker(field, NodeFilter.SHOW_TEXT);
            var nodes = [], node;
            while ((node = walker.nextNode())) {
                var characters = Array.from(node.nodeValue.replace(/\s+/g, ' '));
                nodes.push({node: node, characters: characters});
                node.nodeValue = '';
            }
            field.classList.add('overview-typing');
            fields.push({field: field, nodes: nodes});
        });
        function writeField(index) {
            if (index >= fields.length || !details.isConnected) return;
            var entry = fields[index], nodeIndex = 0, characterIndex = 0;
            entry.field.classList.add('overview-typing-active');
            function writeCharacter() {
                if (!details.isConnected) return;
                while (nodeIndex < entry.nodes.length && characterIndex >= entry.nodes[nodeIndex].characters.length) {
                    nodeIndex++; characterIndex = 0;
                }
                if (nodeIndex >= entry.nodes.length) {
                    entry.field.classList.remove('overview-typing-active');
                    window.setTimeout(function () { writeField(index + 1); }, 40);
                    return;
                }
                var text = entry.nodes[nodeIndex];
                text.node.nodeValue += text.characters[characterIndex++];
                window.setTimeout(writeCharacter, 12);
            }
            writeCharacter();
        }
        writeField(0);
    }
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
