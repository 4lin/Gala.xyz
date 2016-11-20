/**
 * Timer handler
 * 
 * @param integer interval  Default is 1000
 * @param boolean autostart Default is true
 */
var TimerHandler = function(interval, autostart) {
    if (typeof(interval) == 'undefined') {
        interval = 1000;
    }
    
    this._interval   = interval;
    this._callbacks  = new Array();
    this._intervalId = null;
    
    if (autostart != false) {
        this.startTimer();
    }
}

/**
 * Append a callback to the timer
 * 
 * Returns the index required to remove the callback again
 * 
 * @param  object method
 * @return integer
 */
TimerHandler.prototype.appendCallback = function(method) {
    var index = this._callbacks.length;
    
    this._callbacks[this._callbacks.length] = method;
    
    return index;
}

TimerHandler.prototype.removeCallback = function(index) {
    this._callbacks[index] = null;
}

/**
 * Start the timer
 * 
 * @return void
 */
TimerHandler.prototype.startTimer = function() {
    var instance     = this;
    this._intervalId = window.setInterval(function() { instance._timer(); }, this._interval);
}

/**
 * Stop the timer
 * 
 * @return void
 */
TimerHandler.prototype.stopTimer = function() {
    window.clearInterval(this._intervalId);
}

/**
 * Timer which is called every N seconds
 * 
 * Executes every assigned callback
 * 
 * @return void
 */
TimerHandler.prototype._timer = function() {
    for (var i = 0; i < this._callbacks.length; i++) {
        if (this._callbacks[i] != null) {
            this._callbacks[i]();
        }
    }
}