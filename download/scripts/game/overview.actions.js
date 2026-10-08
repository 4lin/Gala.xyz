$(function() {
	$('#tabs').tabs();
});

function checkrename()
{
	if(String(($('#name').val()) ?? '').trim() == '') {
		return false;
	} else {
		$.getJSON('game.php?page=overview&mode=rename&name='+$('#name').val(), function(response){
			alert(response.message);
			if(!response.error) {
				parent.location.reload();
			}
		});
	}
}

function checkcancel()
{
	var password = $('#password').val();
	if(password == '') {
		return false;
	} else {
		$.post('game.php?page=overview', {'mode' : 'delete', 'password': password}, function(response) {
			alert(response.message);
			if(response.ok){
				parent.location.reload();
			}
		}, "json");
	}
}

function toggleReferralPanel(event)
{
    if (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
    }
    var panel = document.getElementById('overviewReferralPanel');
    var toggle = document.querySelector('.referral-toggle');
    if (!panel) return false;
    panel.hidden = !panel.hidden;
    if (toggle) toggle.setAttribute('aria-expanded', panel.hidden ? 'false' : 'true');
    return false;
}
