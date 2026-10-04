const fs = require('fs'), vm = require('vm'), assert = require('assert');
// Exercise the real clock, countdown and AJAX navigation with an in-memory DOM.
let mono = 0, displayed = [], requests = [], pending, click, intervals = new Map(), nextInterval = 0;
let readyHandler, submitHandler, rootPage = 'buildings';
const root = {getAttribute: key => key === 'data-server-time' || key === 'data-server-received' ? '1000' : key === 'data-server-sent' ? '1003' : '{}', setAttribute() {}, style:{setProperty(){}}};
const currentRoot = () => root;
function selection(selector) {
    return {length: /#progressbar|#time/.test(selector) ? 1 : 0,
        attr(key) {if(key==='data-time') return selector.includes('#progressbar')?'10':'20'; if(key==='data-endtime') return '1010'; return this;},
        text(value) {displayed.push(value);return this;}, prop(){return this;},css(){return this;},progressbar(){return this;},
        find(){return selection('button');},off(){submitHandler=null;return this;},
        on(event, selectorOrHandler, handler) {
            if(event==='gala:page-ready') readyHandler=selectorOrHandler;
            if(event.startsWith('click')) click=handler;
            if(event.startsWith('submit')) submitHandler=handler;
            return this;
        },trigger(event){if(event==='gala:page-ready') readyHandler();return this;}};
}
function $(arg) {if(typeof arg==='function') return arg();return selection(typeof arg==='string'?arg:'object');}
$.fn={}; $.ajax=options=>{requests.push(options);pending={done(fn){this.success=fn;return this;},fail(fn){this.failure=fn;return this;},always(fn){this.finish=fn;return this;}};return pending;};
const table={innerHTML:'',getAttribute:()=> '{}',setAttribute(){}};
const content={getAttribute:()=>null,replaceWith(){rootPage='research';}};
const fresh={querySelector:()=>root,querySelectorAll:()=>[],setAttribute(){}};
const context={$ ,URL,Date,console,document:{body:{id:'buildings'},querySelector:currentRoot,getElementById:id=>id==='content'?content:id==='resourceTable'?table:null},
    performance:{now:()=>mono,getEntriesByType:()=>[]},
    location:{href:'http://127.0.0.1:8766/game.php?page=buildings',origin:'http://127.0.0.1:8766',pathname:'/game.php'},
    history:{pushState(){}},scrollTo(){},addEventListener(){},
    clearInterval(id){intervals.delete(id);},setInterval(fn){const id=++nextInterval;intervals.set(id,fn);return id;},
    GetRestTimeFormat:s=>Math.ceil(s),DOMParser:class{parseFromString(){return {body:{id:'research'},title:'Research',getElementById:id=>id==='content'?fresh:id==='resourceTable'?table:null};}}};
context.window=context;
vm.createContext(context);
function load(path){vm.runInContext(fs.readFileSync(path,'utf8'),context,{filename:path});}
load('scripts/game/clock.js'); context.GalaClock.initialize(1000);
load('scripts/game/construction-ajax.js');load('scripts/game/page-navigation.js');
assert.equal(displayed.at(-1),10);assert.equal(intervals.size,1);
click.call({href:'http://127.0.0.1:8766/game.php?page=research',target:'_self',hasAttribute:()=>false},
    {which:1,isDefaultPrevented:()=>false,preventDefault(){}});
mono=3000;pending.success('<fixture>');pending.finish();
assert.equal(context.document.body.id,'research');assert.equal(rootPage,'research');
assert.equal(displayed.at(-1),7,'AJAX response latency must not restart ten seconds');
assert.equal(intervals.size,1,'Navigation disposes the previous countdown');
mono=63000;Array.from(intervals.values()).forEach(fn=>fn());
assert.equal(requests.length,2,'A delayed callback issues one completion refresh');
Array.from(intervals.values()).forEach(fn=>fn());assert.equal(requests.length,2,'No duplicate completion while busy');
// Updating serverTime elsewhere cannot slow down the Overview clock.
let overviewCallback,reloads=0,progress;
const timer={data:()=>10,attr:()=> '1010',closest:()=>({length:1,data:()=>20,find:()=>({css:(key,value)=>{progress=value;}})}),text(){}};
context.$=arg=>arg===timer?timer:arg===context.document?{ready:fn=>fn()}:arg==='.timer'?{each:fn=>fn.call(timer)}:{each(){}};
context.setInterval=fn=>{overviewCallback=fn;};context.location={set href(value){reloads++;}};
mono=0;context.GalaClock.initialize(1000);load('scripts/game/overview.js');
mono=60000;overviewCallback();assert.equal(reloads,1);assert.equal(progress,'100%');
// Wall-clock adjustments do not affect the monotonic countdown.
const before=context.GalaClock.now();context.Date={now:()=>999999999999};assert.equal(context.GalaClock.now(),before);
// Shipyard retains the next-unit countdown while compensating response age.
let shipMono=3000,shipDisplay;
const shipRoot={getAttribute:key=>key==='data-mode'?'defense':key==='data-server-time'?'1000':JSON.stringify({Queue:[['Shield',3,10,409]],b_hangar_id_plus:5})};
function shipSelection(){return {length:0,find(){return this;},text(value){shipDisplay=value;return this;},css(){return this;},on(){return this;}};}
function ship$(arg){if(typeof arg==='function') return arg();return shipSelection();}
ship$.fn={};
const ship={$:ship$,document:{body:{id:'shipyard'},querySelector:()=>shipRoot,getElementById:()=>null},performance:{now:()=>shipMono,getEntriesByType:()=>[]},Date,console,clearInterval(){},setInterval(){},GetRestTimeFormat:Math.ceil};
ship.window=ship;vm.createContext(ship);vm.runInContext(fs.readFileSync('scripts/game/clock.js','utf8'),ship);
ship.GalaClock.initialize(1000);ship.GalaClock.sync(1000,0,1000,1003);
vm.runInContext(fs.readFileSync('scripts/game/construction-ajax.js','utf8'),ship);
assert.equal(shipDisplay,2,'Shipyard must keep the next-unit deadline and deduct response latency');
console.log('PASS: AJAX latency, real navigation lifecycle, delayed completion, single active timer, Overview delayed callback, monotonic clock, shipyard next-unit deadline');
