document.addEventListener('DOMContentLoaded', function () {
 var tabs = document.querySelectorAll('#imperium-tabs [role="tab"]');
 var panels = document.querySelectorAll('#imperium-table [role="tabpanel"]');
 if (!tabs.length) return;
 function activate(tab) {
  for (var i = 0; i < tabs.length; i++) {
   var selected = tabs[i] === tab;
   tabs[i].setAttribute('aria-selected', selected ? 'true' : 'false');
   tabs[i].tabIndex = selected ? 0 : -1;
  }
  for (var j = 0; j < panels.length; j++) panels[j].hidden = panels[j].id !== tab.getAttribute('aria-controls');
 }
 for (var i = 0; i < tabs.length; i++) {
  tabs[i].addEventListener('click', function () { activate(this); });
  tabs[i].addEventListener('keydown', function (event) {
   if (event.key !== 'ArrowRight' && event.key !== 'ArrowLeft') return;
   event.preventDefault();
   var index = Array.prototype.indexOf.call(tabs, this);
   var next = tabs[(index + (event.key === 'ArrowRight' ? 1 : tabs.length - 1)) % tabs.length];
   activate(next); next.focus();
  });
 }
 activate(tabs[0]);
});
