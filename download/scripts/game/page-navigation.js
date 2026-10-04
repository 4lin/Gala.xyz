/* Navigate only pages with an explicit lifecycle; never replay commands. */
$(function () {
    var roots = {buildings: '#buildingsOv', research: '#researchOv', shipyard: '#shipyardOv'};
    var loading = false;
    function target(value) {
        var url = new URL(value, location.href);
        if (url.origin !== location.origin || url.pathname !== location.pathname) return null;
        if (!roots[url.searchParams.get('page')]) return null;
        var valid = true;
        url.searchParams.forEach(function (_, key) {
            if (['page', 'mode', 'focus'].indexOf(key) < 0) valid = false;
        });
        return valid ? url : null;
    }
    function destroyTips(scope) {
        if ($.fn.tooltipster) $(scope).find('.tooltipstered').each(function () { $(this).tooltipster('destroy'); });
    }
    function initTips(scope) {
        if (!$.fn.tooltipster) return;
        $(scope).find('.tooltip, .destrucTip, .interacTip').each(function () {
            var interactive = $(this).is('.destrucTip, .interacTip');
            var options = {animation: 'fade', theme: 'tooltipster-punk',
                contentCloning: true, interactive: interactive, contentAsHTML: interactive,
                functionBefore: function (instance, helper) {
                    var content = $(helper.origin).attr('data-tooltip-content');
                    if ($(helper.origin).is('.thumbnail-tip')) {
                        instance.option('theme', 'thumbnail-tooltip');
                        instance.option('maxWidth', null);
                        instance.option('arrow', false);
                    } else if ($(helper.origin).closest('#researchOv').length) {
                        instance.option('maxWidth', 320);
                        instance.option('theme', ['tooltipster-punk', 'research-tooltip']);
                    }
                    instance.option('contentAsHTML', typeof content !== 'undefined');
                    if (typeof content !== 'undefined') instance.content(content);
                }};
            if ($(this).is('.destrucTip')) {
                options.trigger = 'custom';
                options.triggerOpen = {mouseenter: true, touchstart: true};
                options.triggerClose = {click: true, scroll: true, tap: true};
            }
            $(this).tooltipster(options);
        });
    }
    function resourceData(fresh) {
        var resources = JSON.parse(fresh.getAttribute('data-construction-resources') || 'null');
        if (!resources) throw new Error('Missing resource data');
        return resources;
    }
    function navigate(url, historyNavigation) {
        if (loading) return;
        if (window.GalaConstruction && !window.GalaConstruction.canLeave()) {
            if (historyNavigation) location.reload();
            return;
        }
        loading = true;
        $('#content').attr('aria-busy', 'true');
        var requestStarted = window.GalaClock ? window.GalaClock.requestTime() : Date.now();
        $.ajax({url: url.href, type: 'GET', dataType: 'html', timeout: 15000}).done(function (html) {
            try {
                var parsed = new DOMParser().parseFromString(html, 'text/html');
                var page = url.searchParams.get('page');
                var fresh = parsed.getElementById('content');
                var table = parsed.getElementById('resourceTable');
                if (parsed.body.id !== page || !fresh || !fresh.querySelector(roots[page]) || !table) {
                    throw new Error('Invalid navigation response');
                }
                if (window.GalaClock) window.GalaClock.sync(fresh.querySelector(roots[page]).getAttribute('data-server-time'), requestStarted, fresh.querySelector(roots[page]).getAttribute('data-server-received'), fresh.querySelector(roots[page]).getAttribute('data-server-sent'));
                var resources = resourceData(table);
                var configs = {};
                Object.keys(resources).forEach(function (key) {
                    var data = resources[key], id = 'current_' + data.name;
                    var config = $('#' + id).data('resourceTicker');
                    if (config && typeof data.production !== 'undefined') {
                        config.production = data.production;
                        config.limit = [0, data.max];
                        config.available = Number(data.current) - Number(data.production) / 3600 * (serverTime.getTime() - startTime) / 1000;
                        configs[id] = config;
                    }
                });
                if (window.GalaConstruction) window.GalaConstruction.dispose();
                $(document).trigger('gala:page-dispose');
                destroyTips(document.getElementById('content'));
                destroyTips(document.getElementById('resourceTable'));
                // Response scripts are deliberately not evaluated.
                fresh.querySelectorAll('script').forEach(function (script) { script.remove(); });
                fresh.setAttribute('data-navigation', 'ajax');
                document.getElementById('content').replaceWith(fresh);
                document.getElementById('resourceTable').innerHTML = table.innerHTML;
                document.getElementById('resourceTable').setAttribute('data-construction-resources', table.getAttribute('data-construction-resources'));
                Object.keys(configs).forEach(function (id) { $('#' + id).data('resourceTicker', configs[id]); });
                var menu = parsed.getElementById('menuTable');
                if (menu) {
                    destroyTips(document.getElementById('menuTable'));
                    document.getElementById('menuTable').innerHTML = menu.innerHTML;
                    initTips(document.getElementById('menuTable'));
                }
                document.body.id = page;
                document.title = parsed.title;
                if (!historyNavigation) history.pushState({galaNavigation: true}, '', url.href);
                initTips(fresh);
                initTips(document.getElementById('resourceTable'));
                $(document).trigger('gala:page-ready');
                window.scrollTo(0, 0);
                var focus = url.searchParams.get('focus');
                if (focus && /^[0-9]+$/.test(focus)) {
                    var trigger = fresh.querySelector('a.detail_button[ref="' + focus + '"]');
                    if (trigger) trigger.click();
                }
            } catch (error) {
                console.warn('AJAX navigation fallback:', error.message);
                location.assign(url.href);
            }
        }).fail(function () { location.assign(url.href); }).always(function () {
            loading = false;
            $('#content').attr('aria-busy', 'false');
        });
    }
    $(document).on('click.galaNavigation', '#menuTable a, #content a', function (event) {
        if (event.isDefaultPrevented() || event.which !== 1 || event.ctrlKey || event.metaKey || event.shiftKey || event.altKey || (this.target && this.target !== '_self') || this.hasAttribute('download')) return;
        var url = target(this.href);
        if (!url) return;
        event.preventDefault();
        navigate(url, false);
    });
    window.addEventListener('popstate', function () {
        var url = target(location.href);
        if (url && !loading) navigate(url, true);
        else location.reload();
    });
});
