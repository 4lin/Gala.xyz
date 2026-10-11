const fs = require('fs');
const vm = require('vm');
const path = require('path');
const root = path.join(__dirname, '../scripts/game');
const source = fs.readFileSync(path.join(root, 'base.js'), 'utf8');
for (const file of ['base.js', 'fleettrader.js', 'flotten.js']) {
    new vm.Script(fs.readFileSync(path.join(root, file), 'utf8'), {filename: file});
}
const context = {navigator: {userAgent: 'Chrome'}};
vm.createContext(context);
vm.runInContext(source.slice(0, source.indexOf('function getFormatedDate')), context);
for (const value of [0, 9999, 10000, 1e6, -1e6, 1e12, 1e21]) {
    const result = context.display_number_js(value);
    if (Math.abs(value) >= 10000 && !result.includes('title="' + context.NumberGetHumanReadable(value) + '"')) {
        throw new Error('Full value is unavailable');
    }
    if (Math.abs(value) < 10000 && result !== context.NumberGetHumanReadable(value)) {
        throw new Error('Small numeric display changed');
    }
}
console.log('PASS: compact display, full values, and browser script syntax');
