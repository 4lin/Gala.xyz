const fs = require('fs');
const vm = require('vm');
const context = { $: function () {}, navigator: {userAgent: ''} };
context.$.ui = {autocomplete: function () {}};
context.$.widget = function () {};
vm.createContext(context);
vm.runInContext(fs.readFileSync(__dirname + '/../scripts/game/base.js', 'utf8'), context);
for (const [value, expected] of [[400000000,'400&nbsp;M'],[1000000000,'1&nbsp;B'],[1000000000000,'1&nbsp;T'],[-1000000000,'-1&nbsp;B']]) {
    if (context.shortly_number(value) !== expected) throw new Error('Incorrect scale for '+value);
}
console.log('PASS: JavaScript resource abbreviations use the same thousand-based scales');
