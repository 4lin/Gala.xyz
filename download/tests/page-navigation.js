const fs = require('fs'), vm = require('vm'), assert = require('assert');
let click, pending, requests = [], assigned = [], reloads = 0, canLeave = true;
function selection() { return {attr() {return this;},on(event, selector, handler) {click = handler;return this;}}; }
function $(arg) {if (typeof arg === 'function') return arg(); return selection();}
$.ajax = options => {
    requests.push(options);
    pending = {done(fn) {this.success = fn;return this;},fail(fn) {this.failure = fn;return this;},always(fn) {this.finish = fn;return this;}};
    return pending;
};
const context = {$, URL, document:{}, console,
    location:{href:'http://127.0.0.1:8766/game.php?page=research',origin:'http://127.0.0.1:8766',pathname:'/game.php',assign(url) {assigned.push(url);},reload() {reloads++;}},
    window:{GalaConstruction:{canLeave:()=>canLeave},addEventListener() {}},history:{}};
vm.runInNewContext(fs.readFileSync('scripts/game/page-navigation.js','utf8'), context);
function follow(href, target = '_self', options = {}) {
    let prevented = false;
    click.call({href,target,hasAttribute:()=>false},Object.assign({which:1,isDefaultPrevented:()=>false,preventDefault(){prevented=true;}},options));
    return prevented;
}
assert.equal(follow('http://127.0.0.1:8766/game.php?page=buildings'),true);
assert.equal(requests.length,1); assert.equal(requests[0].type,'GET');
follow('http://127.0.0.1:8766/game.php?page=shipyard&mode=defense');
assert.equal(requests.length,1,'rapid second navigation is not duplicated');
pending.failure(); pending.finish();
assert.equal(assigned.length,1,'GET failure falls back to normal navigation');
for (const url of ['http://example.org/game.php?page=research','http://127.0.0.1:8766/admin.php?page=research','http://127.0.0.1:8766/game.php?page=research&cmd=insert','http://127.0.0.1:8766/game.php?page=overview']) {
    assert.equal(follow(url),false,'unsupported or command link keeps normal navigation');
}
assert.equal(follow('http://127.0.0.1:8766/game.php?page=research','_blank'),false);
assert.equal(follow('http://127.0.0.1:8766/game.php?page=research','_self',{ctrlKey:true}),false);
canLeave=false;
follow('http://127.0.0.1:8766/game.php?page=research');
assert.equal(requests.length,1,'pending construction command blocks AJAX navigation');
canLeave=true;
follow('http://127.0.0.1:8766/game.php?page=shipyard&mode=defense');
assert.equal(requests.length,2);
assert.ok(requests[1].url.endsWith('page=shipyard&mode=defense'));
assert.ok(requests.every(r=>r.type==='GET'));
console.log('PASS: safe GET routes, command exclusion, modified clicks, busy guard, duplicate guard, fallback');
