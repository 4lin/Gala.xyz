function GetOfficerTime(Element, Time)
{
	if(Time == 0)
		return;
	
	$('#time_'+Element).text(GetRestTimeFormat(Time));
	Time--;
	window.setTimeout("GetOfficerTime("+Element+", "+Time+")", 1000)
}

function openPayment() {
	OpenPopup('pay.php?mode=out', 'payment', 650, 350);
}
$(function () {
 var page = $('#officer-page');
 if (!page.length) return;
 var viewSwitch = page.find('.officer-view-switch');
 var heading = page.find('.officer-section-title');
 if (!heading.length) heading = page.find('h2').first();
 viewSwitch.appendTo(heading);
 var shopHeading = page.find('h2').not(heading).first();
 if (shopHeading.length) {
  var shopSwitch = viewSwitch.clone().removeAttr('id');
  shopSwitch.find('button').removeAttr('id');
  shopSwitch.appendTo(shopHeading);
 }
 var toggle = page.find('.officer-view-switch button').addClass('officer-view-toggle');
 function setOfficerView(view) {
  var detailed = view === 'detailed';
  page.toggleClass('officer-detailed', detailed).toggleClass('officer-compact', !detailed);
  var nextView = detailed ? 'compact' : 'detailed';
  var label = toggle.attr('data-' + nextView + '-label');
  toggle.attr('data-officer-view', nextView).attr('aria-label', label).attr('title', label);
  page.find('.officer-description').prop('open', detailed);
  try { localStorage.setItem('officerView', view); } catch (e) {}
 }
 var savedView = 'compact';
 try { savedView = localStorage.getItem('officerView') || 'compact'; } catch (e) {}
 setOfficerView(savedView === 'detailed' ? 'detailed' : 'compact');
 toggle.on('click', function () { setOfficerView($(this).attr('data-officer-view')); });
});
