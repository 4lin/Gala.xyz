const fs = require('fs'), vm = require('vm'), assert = require('assert');
const page = process.argv[2] || 'buildings';
let now = 0, interval, submit, requests = [], form = {};
function selection(selector) {
    return {length: selector.includes('#progressbar') || selector.includes('#time') ? 1 : 0,
        attr(name) { if (name === 'data-time') return selector.includes('#progressbar') ? '5' : '10'; return this; },
        prop() {return this;}, text() {return this;}, css() {return this;}, progressbar() {return this;},
        find() {return selection('button');}, serialize() {return 'cmd=insert&building=1';},
        on(event, target, callback) {if (event.indexOf('submit') === 0) submit = callback; return this;}, off() {submit = null; return this;}};
}
function $(arg) {if (typeof arg === 'function') return arg(); return selection(typeof arg === 'string' ? arg : 'object');}
$.fn = {};
$.ajax = opts => {const request = {opts};requests.push(request);return {done(fn) {request.done=fn;return this;},fail(fn) {request.fail=fn;return this;},always(fn) {request.always=fn;return this;}};};
const context = { $, window: {}, document:{body:{id:page},getElementById:()=>null,querySelector:()=>({style:{setProperty(){}},getAttribute:key=>key==='data-mode'?'fleet':JSON.stringify({Queue:[['Test',2,10,212]],b_hangar_id_plus:5})})},Date:{now:()=>now},
    clearInterval(){},setInterval(fn){interval=fn;return 1;},GetRestTimeFormat:String,console };
vm.runInNewContext(fs.readFileSync('scripts/game/construction-ajax.js','utf8'),context);
assert.equal(requests.length,0);
now=6000;interval();assert.equal(requests.length,1);assert.equal(requests[0].opts.type,'GET');assert.equal(requests[0].opts.url, 'game.php?page='+page+(page==='shipyard'?'&mode=fleet':''));
interval();assert.equal(requests.length,1,'one completion request while busy');
requests[0].fail();requests[0].always();interval();assert.equal(requests.length,1,'completion retry waits');
now=12000;interval();assert.equal(requests.length,2);requests[1].always();
submit.call(form,{preventDefault(){},isDefaultPrevented(){return false;}});submit.call(form,{preventDefault(){},isDefaultPrevented(){return false;}});
assert.equal(requests.length,3,'double submit blocked');assert.equal(requests[2].opts.type,'POST');
requests[2].fail();requests[2].always();
assert.equal(requests.filter(r=>r.opts.type==='POST').length,1,'failed POST never replayed');
assert.equal(context.window.GalaConstruction.canLeave(), true);
context.window.GalaConstruction.dispose();
assert.equal(submit, null, 'navigation removes the previous page submit handler');
console.log('PASS: queue completion refresh, single request, retry delay, double-submit guard, no POST replay');
