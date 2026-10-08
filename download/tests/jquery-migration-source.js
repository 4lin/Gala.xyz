const fs=require('fs'),assert=require('assert');
const header=fs.readFileSync('styles/templates/game/main.header.tpl','utf8');
assert.equal((header.match(/src=["']\/scripts\/base\/jquery\.js\?v=4\.0\.0/g)||[]).length,1);
assert.ok(header.indexOf('jquery.js?v=4.0.0')<header.indexOf('navigation.js'));
assert.ok(header.includes('window.ogame = window.ogame || {}'));
assert.ok(header.includes('window.isMobile = window.matchMedia("(pointer: coarse)").matches'));
assert.ok(!fs.readFileSync('scripts/game/inventory.js','utf8').includes('jQuery v1.12.4'));
assert.ok(fs.readFileSync('scripts/base/jquery.js','utf8').includes('jQuery JavaScript Library v4.0.0'));
assert.ok(fs.readFileSync('scripts/base/jquery.ui.js','utf8').includes('jQuery UI - v1.14.2'));
for(const file of ['scripts/base/jquery.cookie.js','scripts/base/jquery.tablesorter.js','scripts/game/navigation.js','scripts/game/battlesim.js','scripts/game/overview.actions.js']) {
 assert.ok(!/(?:jQuery|\$)\.(trim|isFunction|isArray|parseJSON|isNumeric)\s*\(/.test(fs.readFileSync(file,'utf8')),file);
}
console.log('PASS: single jQuery load, navigation ordering, correct versions, removed API migration');
