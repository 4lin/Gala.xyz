/* Update construction pages through the existing command controller, without navigation. */
$(function () {
    var page = document.body.id;
    if (['buildings', 'research', 'shipyard'].indexOf(page) < 0) return;
    var isShipyard = page === 'shipyard';
    var rootSelector = '#' + (page === 'buildings' ? 'buildingsOv' : page === 'research' ? 'researchOv' : 'shipyardOv');
    var panelId = page === 'buildings' ? 'building-details-panel' : page === 'research' ? 'research-details-panel' : 'shipyard-details-panel';
    var thumbSelector = page === 'buildings' ? '#building' : page === 'research' ? '#researchOv' : '#shipyardOv';
    var selectedClass = page === 'buildings' ? 'building-panel-selected' : page === 'research' ? 'research-panel-selected' : 'shipyard-panel-selected';
    var itemAttribute = page === 'buildings' ? 'data-building' : page === 'research' ? 'data-research' : 'data-element';
    var url = 'game.php?page=' + page + (isShipyard ? '&mode=' + (document.querySelector(rootSelector).getAttribute('data-mode') || 'fleet') : '');
    var queueData;
    var busy = false, timer, deadline = 0, duration = 0, retryAfter = 0;
    function initTips(scope) {
        if (!$.fn.tooltipster) return;
        $(scope).find('.tooltip:not(.tooltipstered)').tooltipster({
            functionBefore: function (instance, helper) {
                var content = $(helper.origin).attr('data-tooltip-content');
                instance.option('contentAsHTML', typeof content !== 'undefined');
                if (typeof content !== 'undefined') instance.content(content);
            }, animation: 'fade', theme: 'tooltipster-punk', contentCloning: true
        });
    }
    function destroyTips(scope) {
        if ($.fn.tooltipster) $(scope).find('.tooltipstered').each(function () { $(this).tooltipster('destroy'); });
    }
    function startTimer() {
        clearInterval(timer);
        if (isShipyard) { startShipyardTimer(); return; }
        var progress = $(rootSelector + ' #progressbar'), time = $(rootSelector + ' #time');
        if (!progress.length || !time.length) return;
        duration = Number(time.attr('data-time'));
        deadline = Date.now() + Number(progress.attr('data-time')) * 1000;
        progress.progressbar({value: 0});
        tick();
        timer = setInterval(tick, 1000);
    }
    function startShipyardTimer() {
        queueData = JSON.parse(document.querySelector(rootSelector).getAttribute('data-build-list') || '{}');
        if (!queueData.Queue || !queueData.Queue.length) return;
        var select = document.getElementById('auftr');
        if (select) { select.options.length = 0; queueData.Queue.forEach(function (entry, index) { select.options[index] = new Option(entry[1] + ' ' + entry[0], index); }); }
        duration = Math.max(1, Number(queueData.Queue[0][2]));
        deadline = Date.now() + Math.max(0, duration - Number(queueData.b_hangar_id_plus || 0)) * 1000;
        tick(); timer = setInterval(tick, 1000);
    }
    function shipyardTick() {
        var remaining = Math.max(0, (deadline - Date.now()) / 1000);
        var card = $(rootSelector + ' .production-current-build');
        card.find('.defense-current-time').text(GetRestTimeFormat(remaining));
        card.find('.defense-current-progress').css('height', Math.min(100, Math.max(0, 100 * (1 - remaining / duration))) + '%');
        if (remaining <= 0 && !busy && Date.now() >= retryAfter) request();
    }
    function tick() {
        if (isShipyard) { shipyardTick(); return; }
        var remaining = Math.max(0, (deadline - Date.now()) / 1000);
        var progress = duration > 0 ? Math.min(100, Math.max(0, 100 * (1 - remaining / duration))) : 100;
        $(rootSelector + ' #time').text(GetRestTimeFormat(remaining));
        $(rootSelector + ' #progressbar').progressbar('value', progress);
        $(rootSelector + ' #progressbar .ui-progressbar-value').css('height', progress + '%');
        var element = document.querySelector(rootSelector + ' #progressbar');
        if (element) element.style.setProperty('--construction-progress', progress + '%');
        if (remaining <= 0 && !busy && Date.now() >= retryAfter) request();
    }
    function update(html) {
        var parsed = new DOMParser().parseFromString(html, 'text/html');
        var incoming = parsed.querySelector(rootSelector);
        if (!incoming || !incoming.querySelector('#buttonz')) throw new Error('Invalid Buildings response');
        if (isShipyard) document.querySelector(rootSelector).setAttribute('data-build-list', incoming.getAttribute('data-build-list') || '{}');
        var selected = document.querySelector(thumbSelector + ' a.' + selectedClass);
        var selectedId = selected && selected.getAttribute('ref');
        var panel = document.getElementById(panelId);
        var wasOpen = panel.classList.contains('is-open');
        // Replace only the queue and data affected by construction. No response scripts run.
        ['#buttonz', '.content-box-s'].forEach(function (selector) {
            var current = document.querySelector(rootSelector + ' ' + selector);
            var fresh = incoming.querySelector(selector);
            if (current && fresh) { destroyTips(current); current.replaceWith(fresh); }
        });
        destroyTips(panel);
        panel.querySelectorAll('.building-panel-item').forEach(function (item) { item.remove(); });
        incoming.querySelectorAll('.building-panel-item').forEach(function (item) { panel.appendChild(item); });
        if (wasOpen && selectedId) {
            var item = panel.querySelector('[' + itemAttribute + '="' + selectedId + '"]');
            var trigger = document.querySelector(thumbSelector + ' a[ref="' + selectedId + '"]');
            if (item && trigger) {
                item.hidden = false;
                trigger.setAttribute('aria-expanded', 'true');
                trigger.classList.add(selectedClass);
            }
        }
        var currentTable = document.getElementById('resourceTable');
        var freshTable = parsed.getElementById('resourceTable');
        var resources = freshTable && JSON.parse(freshTable.getAttribute('data-construction-resources') || '{}');
        var tickers = {};
        Object.keys(resources || {}).forEach(function (id) {
            var data = resources[id], cellId = 'current_' + data.name;
            var ticker = $('#' + cellId).data('resourceTicker');
            if (ticker && typeof data.production !== 'undefined') {
                ticker.production = data.production;
                ticker.limit = [0, data.max];
                ticker.available = Number(data.current) - Number(data.production) / 3600 * (serverTime.getTime() - startTime) / 1000;
                tickers[cellId] = ticker;
            }
        });
        if (currentTable && freshTable) {
            destroyTips(currentTable);
            currentTable.innerHTML = freshTable.innerHTML;
            Object.keys(tickers).forEach(function (id) { $('#' + id).data('resourceTicker', tickers[id]); });
            initTips(currentTable);
        }
        if (isShipyard) {
            var select = document.getElementById('auftr');
            var list = JSON.parse(incoming.getAttribute('data-build-list') || '{}');
            if (select && list.Queue) list.Queue.forEach(function (entry, index) { select.options[index] = new Option(entry[1] + ' ' + entry[0], index); });
        }
        initTips(document.querySelector(rootSelector));
        startTimer();
    }
    function request(form) {
        if (busy) return;
        busy = true;
        var buttons = form ? $(form).find('button:enabled') : $();
        var data = form ? $(form).serialize() : null;
        buttons.prop('disabled', true);
        $(rootSelector + ' .construction-request-error').prop('hidden', true);
        $(rootSelector).attr('aria-busy', 'true');
        // Never automatically retry a POST: its command may already have been saved.
        $.ajax({url: url, type: form ? 'POST' : 'GET', data: data, dataType: 'html'})
            .done(function (html) {
                try { update(html); } catch (error) { failed(); }
            }).fail(failed).always(function () {
                busy = false;
                buttons.prop('disabled', false);
                $(rootSelector).attr('aria-busy', 'false');
            });
    }
    function failed() {
        retryAfter = Date.now() + 5000;
        $(rootSelector + ' .construction-request-error').prop('hidden', false);
    }
    $(function () {
        $(document).on('submit', rootSelector + ' form', function (event) {
            if (event.isDefaultPrevented()) return;
            event.preventDefault(); request(this);
        });
        startTimer();
    });
});
