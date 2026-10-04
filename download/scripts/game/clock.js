/* Anchor server timestamps to elapsed monotonic time, never to callback counts. */
(function (global) {
    var anchorEpoch = 0, anchorTick = 0, initialEpoch = 0;
    function tick() {
        return global.performance && typeof global.performance.now === 'function' ? global.performance.now() : Date.now();
    }
    function now() { return anchorEpoch + Math.max(0, tick() - anchorTick); }
    function elapsed() { return now() - initialEpoch; }
    function sync(seconds, requestStarted, receivedSeconds, sentSeconds) {
        var ended = tick(), epoch = Number(seconds) * 1000;
        if (!isFinite(epoch) || epoch <= 0) return;
        var received = Number(receivedSeconds) * 1000, sent = Number(sentSeconds) * 1000;
        if (received > 0 && sent >= received && typeof requestStarted === 'number') {
            // Remove server processing from RTT; split remaining transport time equally.
            // Asymmetric transport contributes half its directional difference as error.
            var transport = Math.max(0, ended - requestStarted - (sent - received));
            epoch = sent + transport / 2;
        }
        anchorEpoch = epoch;
        anchorTick = ended;
        if (global.serverTime && typeof global.startTime === 'number') {
            global.serverTime.setTime(global.startTime + elapsed());
        }
    }
    function initialize(seconds, receivedSeconds, sentSeconds) {
        var started = tick();
        if (global.performance && typeof global.performance.getEntriesByType === 'function') {
            var navigation = global.performance.getEntriesByType('navigation')[0];
            if (navigation && navigation.requestStart > 0) started = navigation.requestStart;
        }
        initialEpoch = Number(seconds) * 1000;
        sync(seconds, started, receivedSeconds, sentSeconds);
    }
    global.GalaClock = {now: now, elapsed: elapsed, requestTime: tick, sync: sync, initialize: initialize};
}(window));
