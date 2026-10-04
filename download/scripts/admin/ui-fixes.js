// Configuration pages belong inside the administration navigation frame.
if (window.top === window.self && /^(config|configuni)$/.test(document.body ? document.body.id : new URLSearchParams(window.location.search).get('page'))) {
 window.location.replace('admin.php?view=' + new URLSearchParams(window.location.search).get('page'));
}
$(function () {
 $('.tooltip').each(function () {
  var icon = $(this);
  var content = icon.attr('data-tooltip-content') || icon.attr('title');
  if (!content) return;
  icon.attr('tabindex', '0');
  icon.tooltipster({content: content, contentAsHTML: true, maxWidth: 360, delay: 100, trigger: 'custom', triggerOpen: {mouseenter: true, focus: true, touchstart: true}, triggerClose: {mouseleave: true, blur: true, tap: true}});
 });
});

$(function () {
 if (!/^(config|configuni)$/.test(document.body.id)) return;
 var table = $('form > table').first().addClass('admin-config-table');
 var nav = $('<div class="admin-config-tabs" role="tablist"></div>').insertBefore(table);
 var groups = [], current;
 table.find('tr').each(function () {
  var row = $(this), heading = row.children('th').first();
  if (heading.length) {
   current = {rows: $(), button: $('<button type="button" role="tab"></button>').text(heading.text()).appendTo(nav)};
   groups.push(current);
  }
  if (current && !row.find('input[type=submit]').length) current.rows = current.rows.add(row);
 });
 function select(index) {
  $.each(groups, function (i, group) {
   group.rows.toggle(i === index);
   group.button.attr({'aria-selected': i === index ? 'true' : 'false', tabindex: i === index ? '0' : '-1'});
  });
 }
 $.each(groups, function (i, group) {
  group.button.on('click', function () { select(i); }).on('keydown', function (event) {
   var next = event.which === 39 ? (i + 1) % groups.length : event.which === 37 ? (i + groups.length - 1) % groups.length : -1;
   if (next >= 0) { event.preventDefault(); select(next); groups[next].button.focus(); }
  });
 });
 select(0);
});

$(function () {
 if (document.body.id !== 'menu') return;
 var headings = $('#leftmenu #menu > li > a[href="javascript:void(0);"]');
 var groups = [];
 headings.each(function (index) {
  var heading = $(this), row = heading.parent();
  var items = row.nextUntil('li:has(a[href="javascript:void(0);"])').filter(':has(a)');
  var button = $('<button type="button" class="admin-menu-heading" aria-expanded="false"></button>').text(heading.text());
  heading.replaceWith(button);
  items.hide();
  groups.push({button: button, items: items});
  button.on('click', function () {
   var open = button.attr('aria-expanded') !== 'true';
   $.each(groups, function (i, group) {
    group.button.attr('aria-expanded', i === index && open ? 'true' : 'false');
    group.items.stop(true, true).toggle(i === index && open);
   });
  });
 });
});

$(function () {
 if (!/^(menu|topnav|login)$/.test(document.body.id) && !document.body.classList.contains('standalone')) document.body.classList.add('admin-content-page');
});

$(function () {
 var searchType = new URLSearchParams(location.search).get('search');
 if (document.body.id !== 'search' || ['online', 'p_connect', 'users', 'planet'].indexOf(searchType) === -1) return;
 if (searchType === 'p_connect' || searchType === 'planet') document.body.classList.add('admin-active-planets-page');
 document.body.classList.add('admin-online-page');
 var form = $('body > form'), result = form.children('table').filter(function () { return $(this).find('tr').first().children().length > 1; }).first();
 var header = result.find('tr').first(), labels = header.children().map(function () { return $(this).text().trim(); }).get();
 result.addClass('admin-online-results');
 header.addClass('admin-online-labels');
 result.find('tr').not(header).each(function () {
  var cells = $(this).children();
  if (cells.length === labels.length) {
   $(this).addClass('admin-online-record');
   cells.each(function (i) { $(this).attr('data-label', labels[i]); });
  } else { $(this).addClass('admin-online-summary'); cells.filter('[colspan]').attr('colspan', labels.length); }
 });
 var filterTable = $('#seeker > table'), rows = filterTable.find('tr');
 var filterLabels = rows.eq(1).children(), fields = rows.eq(2).children();
 var grid = $('<div class="admin-online-filters"></div>');
 fields.each(function (i) {
  var field = $('<div class="admin-online-filter"></div>').appendTo(grid);
  var label = filterLabels.eq(i).text().trim();
  if (label) {
   var control = $(this).find('input, select').first().attr('id', 'online-filter-' + i);
   $('<label></label>').attr('for', control.attr('id')).text(label).appendTo(field);
  }
  field.append($(this).contents());
 });
 var title = $('<h2 class="admin-online-filter-title"></h2>').text(rows.first().text().trim());
 var panel = $('<div class="admin-online-filter-panel"></div>').append(title, grid);
 rows.slice(3).each(function () { panel.append($('<div></div>').append($(this).children().contents())); });
 filterTable.replaceWith(panel);
 form.children('table').each(function () { if (!$(this).text().trim() && !$(this).find('input, a, img').length) $(this).hide(); });
});
