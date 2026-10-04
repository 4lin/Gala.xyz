/* In-page selection preserves the existing server-side build commands. */
var ShipyardPanel = (function () {
    var lastTrigger, closeTimer, openingFrame;
    function setHoverTips(enabled) {
        if (!$.fn.tooltipster) return;
        $('#shipyardOv .interacTip.tooltipstered').each(function () {
            $(this).tooltipster('close');
            $(this).tooltipster(enabled ? 'enable' : 'disable');
        });
    }
    function close() {
        var panel = $('#shipyard-details-panel');
        if (openingFrame) cancelAnimationFrame(openingFrame);
        clearTimeout(closeTimer);
        panel.removeClass('is-open');
        $('#shipyardOv a[aria-controls="shipyard-details-panel"]').attr('aria-expanded', 'false').removeClass('shipyard-panel-selected');
        closeTimer = setTimeout(function () {
            panel.prop('hidden', true);
            panel.find('.building-panel-item').prop('hidden', true);
            setHoverTips(true);
        }, window.matchMedia('(prefers-reduced-motion: reduce)').matches ? 0 : 350);
        if (lastTrigger) lastTrigger.focus();
    }
    function open(id, trigger) {
        var panel = $('#shipyard-details-panel');
        var item = panel.find('[data-element="' + id + '"]');
        if (!item.length) return false;
        if (!item.prop('hidden') && panel.hasClass('is-open')) { close(); return false; }
        clearTimeout(closeTimer);
        setHoverTips(false);
        if (openingFrame) cancelAnimationFrame(openingFrame);
        panel.find('.building-panel-item').prop('hidden', true);
        item.prop('hidden', false);
        panel.prop('hidden', false);
        openingFrame = requestAnimationFrame(function () {
            openingFrame = requestAnimationFrame(function () { panel.addClass('is-open'); });
        });
        $('#shipyardOv a[aria-controls="shipyard-details-panel"]').attr('aria-expanded', 'false').removeClass('shipyard-panel-selected');
        $(trigger).attr('aria-expanded', 'true').addClass('shipyard-panel-selected');
        lastTrigger = trigger;
        return false;
    }
    $(function () {
        $(document).on('click', '#shipyard-details-panel .building-panel-close', close);
        $(document).on('click', '#shipyard-details-panel .shipyard-panel-max', function () {
            var form = $(this).closest('form');
            form.find('input[name^="fmenge"]').val(form.attr('data-max')).trigger('input');
        });
        $(document).on('submit', '#shipyard-details-panel .shipyard-panel-form', function (e) {
            var input = $(this).find('input[name^="fmenge"]');
            var value = input.val();
            var maximum = Number($(this).attr('data-max'));
            if (!/^[0-9]+$/.test(value) || Number(value) < 1 || Number(value) > maximum || input.prop('disabled')) {
                e.preventDefault();
                input.focus();
            }
        });
        $('#shipyard-details-panel').on('keydown', function (e) { if (e.key === 'Escape') close(); });
    });
    return { open: open, close: close };
}());
