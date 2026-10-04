$(function () {
 var page = $('#tech-tree-page'), links = page.find('.tech-tree-categories a'), panels = page.find('.tech-map-panel');
 function draw() {
  page.find('.tech-map-panel:visible .tech-map-network').each(function () {
   var network = this, rect = network.getBoundingClientRect(), target = network.querySelector('.tech-map-target').getBoundingClientRect(), svg = network.querySelector('svg');
   while (svg.firstChild) svg.removeChild(svg.firstChild);
   svg.setAttribute('viewBox', '0 0 ' + rect.width + ' ' + rect.height);
   $(network).find('.tech-map-dependency').each(function (index) {
    var r = this.getBoundingClientRect(), x = r.right - rect.left, y = r.top + r.height / 2 - rect.top;
    var tx = target.left - rect.left, ty = target.top + target.height / 2 - rect.top, mid = x + (tx-x) * (0.35 + index * 0.08);
    var path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
    path.setAttribute('d', 'M ' + x + ' ' + y + ' H ' + mid + ' V ' + ty + ' H ' + tx);
    path.setAttribute('stroke', $(this).hasClass('requirement-missing') ? '#d76670' : '#64b881');
    svg.appendChild(path);
   });
  });
 }
 function select(index) {
  panels.hide().eq(index).show();
  links.each(function (i) { $(this).attr({'aria-selected': i === index ? 'true' : 'false', tabindex: i === index ? '0' : '-1'}); });
  draw();
 }
 links.each(function (i) {
  $(this).on('click', function (event) { event.preventDefault(); select(i); }).on('keydown', function (event) {
   var next = event.which === 39 ? (i+1)%links.length : event.which === 37 ? (i+links.length-1)%links.length : -1;
   if (next >= 0) { event.preventDefault(); select(next); links.eq(next).focus(); }
  });
 });
 $(window).on('resize load', draw);
 page.find('img').on('load', draw);
 select(0);
});
