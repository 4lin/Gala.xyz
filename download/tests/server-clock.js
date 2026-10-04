const fs = require('fs'), vm = require('vm'), assert = require('assert');
let mono = 0, shown;
const c = {performance:{now:()=>mono,getEntriesByType:()=>[]},Date};
c.window=c; vm.createContext(c);
vm.runInContext(fs.readFileSync('scripts/game/clock.js','utf8'),c);
c.GalaClock.initialize(1000);
// Symmetric two-second transport and one-second server processing.
mono=5000;c.GalaClock.sync(1000,0,1002,1003);
assert.equal(c.GalaClock.now(),1005000);
// Asymmetric transport: four seconds outbound, one second inbound.
mono=6000;c.GalaClock.sync(1000,0,1004,1005);
assert.equal(c.GalaClock.now(),1007500); // True receipt epoch is 1006; error is +1.5 seconds.
// Fractional timestamps are preserved.
mono=100;c.GalaClock.sync(1000,0,1000.04,1000.06);
assert.equal(c.GalaClock.now(),1000100);
mono=60100;assert.equal(c.GalaClock.now(),1060100);
// Initial navigation uses the same precise request/response calculation.
mono=5010;c.performance.getEntriesByType=()=>[{requestStart:10}];
c.GalaClock.initialize(1000,1002,1003);assert.equal(c.GalaClock.now(),1005000);
// Exercise the real visible-clock updater without loading unrelated game actions.
c.serverTime=new Date(1000000);c.startTime=1000000;c.tdformat='fixture';
c.getFormatedDate=value=>String(value);c.$=selector=>({text:value=>{assert.equal(selector,'.servertime');shown=value;}});
const base=fs.readFileSync('scripts/game/base.js','utf8');
vm.runInContext(base.match(/function UhrzeitAnzeigen\(\)\s*\{[\s\S]*?\n\}/)[0],c);
c.serverTime.setTime(c.startTime+c.GalaClock.elapsed());c.UhrzeitAnzeigen();const first=shown;
mono+=1000;c.serverTime.setTime(c.startTime+c.GalaClock.elapsed());c.UhrzeitAnzeigen();
assert.equal(Number(shown)-Number(first),1000);
assert.ok(fs.readFileSync('styles/templates/game/main.topnav.tpl','utf8').includes('class="servertime"'));
console.log('PASS: symmetric/asymmetric latency, processing removal, fractional epoch, initial navigation, delayed callback, visible clock');
