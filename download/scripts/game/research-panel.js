/* In-page selection preserves the existing server-side build commands. */
var ResearchPanel = (function () {
    var lastTrigger, closeTimer, openingFrame;
    function setHoverTips(enabled) {
        if (!$.fn.tooltipster) return;
        $('#researchOv .tooltip.tooltipstered').each(function () {
            $(this).tooltipster('close');
            $(this).tooltipster(enabled ? 'enable' : 'disable');
        });
    }
    function close() {
        var panel = $('#research-details-panel');
        if (openingFrame) cancelAnimationFrame(openingFrame);
        clearTimeout(closeTimer);
        panel.removeClass('is-open');
        $('#researchOv a[aria-controls="research-details-panel"]').attr('aria-expanded', 'false').removeClass('research-panel-selected');
        closeTimer = setTimeout(function () {
            panel.prop('hidden', true);
            panel.find('.building-panel-item').prop('hidden', true);
            setHoverTips(true);
        }, window.matchMedia('(prefers-reduced-motion: reduce)').matches ? 0 : 350);
        if (lastTrigger) lastTrigger.focus();
    }
    function open(id, trigger) {
        var panel = $('#research-details-panel');
        var item = panel.find('[data-research="' + id + '"]');
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
        $('#researchOv a[aria-controls="research-details-panel"]').attr('aria-expanded', 'false').removeClass('research-panel-selected');
        $(trigger).attr('aria-expanded', 'true').addClass('research-panel-selected');
        lastTrigger = trigger;
        return false;
    }
    $(function () {
        $(document).on('click', '#research-details-panel .building-panel-close', close);
        $(document).on('keydown', '#research-details-panel', function (e) { if (e.key === 'Escape') close(); });
    });
    $(document).on('gala:page-dispose', function () {
        clearTimeout(closeTimer);
        if (openingFrame) cancelAnimationFrame(openingFrame);
        lastTrigger = null;
    });
    return { open: open, close: close };
}());
