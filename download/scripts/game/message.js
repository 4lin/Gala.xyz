Message	= {
	MessID : 0,

	MessageCount: function() {
		if(Message.MessID == 100) {
			$('#unread_0').text('0');
			$('#unread_1').text('0');
			$('#unread_2').text('0');
			$('#unread_3').text('0');
			$('#unread_4').text('0');
			$('#unread_5').text('0');
			$('#unread_15').text('0');
			$('#unread_99').text('0');
			$('#unread_100').text('0');
			$('#newmes').text('');
		} else {
			var count = parseInt($('#unread_'+Message.MessID).text());
			var lmnew = parseInt($('#newmesnum').text());
				
			$('#unread_'+Message.MessID).text(Math.max(0, $('#unread_100').text() - 10));
			if(Message.MessID != 999) {
				$('#unread_100').text($('#unread_100').text() - count);
			}
			
			if(lmnew - count <= 0)
				$('#newmes').text('');
			else
				$('#newmesnum').text(lmnew - count);
		}
	},

	getMessages: function (MessID, page) {
		if (typeof page === "undefined") {
			page = 1;
		}
		Message.MessID	= MessID;
		
		$('#loading').show();
		
		if (Message.request) Message.request.abort();
		Message.request = $.get('game.php?page=messages&mode=view&messcat='+MessID+'&site='+page+'&ajax=1', function(data) {
			var parsed = $('<div>').append($.parseHTML(data, document, false));
			var table = parsed.find('#messagestable');
			if (!table.length) {
				location.assign('game.php?page=messages&category='+MessID+'&side='+page);
				return;
			}
			$('#messages-list').empty().append(table.closest('form'));
			$('#message-categories a').attr('aria-current', 'false');
			$('#unread_'+MessID).closest('td').find('a').attr('aria-current', 'true');
			if (MessID !== 999) {
				var read = table.find('.mes_unread').length;
				if (MessID === 100) {
					$.get('game.php?page=messages', function(html) {
						var fresh = $('<div>').append($.parseHTML(html, document, false));
						$('#message-categories span[id^="unread_"]').each(function() {
							$(this).text(fresh.find('#'+this.id).text());
						});
					});
				} else {
					$('#unread_'+MessID).text(Math.max(0, Number($('#unread_'+MessID).text())-read));
					$('#unread_100').text(Math.max(0, Number($('#unread_100').text())-read));
				}
				$('#newmesnum').text(Math.max(0, Number($('#newmesnum').text())-read));
			}
		}).fail(function(_, status) {
			if (status !== 'abort') location.assign('game.php?page=messages&category='+MessID+'&side='+page);
		}).always(function() { $('#loading').hide(); });
	},

	stripHTML: function (string) { 
		return string.replace(/<(.|\n)*?>/g, ''); 
	},

	CreateAnswer: function (Answer) {
		var Answer	= Message.stripHTML(Answer);
		if(Answer.substr(0, 3) == "Re:") {
			return 'Re[2]:'+Answer.substr(3);
		} else if(Answer.substr(0, 3) == "Re[") {
			var re = Answer.replace(/Re\[(\d+)\]:.*/, '$1');
			return 'Re['+(parseInt(re)+1)+']:'+Answer.substr(5+parseInt(re.length))
		} else {
			return 'Re:'+Answer
		}
	},
	
	getMessagesIDs: function(Infos) {
		var IDs = [];
		$.each(Infos, function(index, mess) {
			if(mess.value == 'on')
				IDs.push(mess.name.replace(/delmes\[(\d+)\]/, '$1'));
		});	
		return IDs;
	}
}
