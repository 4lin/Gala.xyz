/* In-page selection preserves the existing server-side build commands. */
var BuildingsPanel = (function () {
    var lastTrigger, closeTimer, openingFrame;
    function close() {
        var panel = $('#building-details-panel');
        if (openingFrame) cancelAnimationFrame(openingFrame);
        clearTimeout(closeTimer);
        panel.removeClass('is-open');
        $('#building a[aria-controls="building-details-panel"]').attr('aria-expanded', 'false').removeClass('building-panel-selected');
        closeTimer = setTimeout(function () {
            panel.prop('hidden', true);
            panel.find('.building-panel-item').prop('hidden', true);
        }, window.matchMedia('(prefers-reduced-motion: reduce)').matches ? 0 : 350);
        if (lastTrigger) lastTrigger.focus();
    }
    function open(id, trigger) {
        var panel = $('#building-details-panel');
        var item = panel.find('[data-building="' + id + '"]');
        if (!item.length) return false;
        if (!item.prop('hidden') && panel.hasClass('is-open')) { close(); return false; }
        clearTimeout(closeTimer);
        if (openingFrame) cancelAnimationFrame(openingFrame);
        panel.find('.building-panel-item').prop('hidden', true);
        item.prop('hidden', false);
        panel.prop('hidden', false);
        openingFrame = requestAnimationFrame(function () {
            openingFrame = requestAnimationFrame(function () { panel.addClass('is-open'); });
        });
        $('#building a[aria-controls="building-details-panel"]').attr('aria-expanded', 'false').removeClass('building-panel-selected');
        $(trigger).attr('aria-expanded', 'true').addClass('building-panel-selected');
        lastTrigger = trigger;
        return false;
    }
    $(function () {
        $(document).on('click', '#building-details-panel .building-panel-close', close);
        $('#building-details-panel').on('keydown', function (e) { if (e.key === 'Escape') close(); });
    });
    return { open: open, close: close };
}());
