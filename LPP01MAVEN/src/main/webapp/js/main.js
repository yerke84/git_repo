$(document).ready(function() {

	$('#my_AJAX_btn').click(function(event) {

		var txt = $('#mytext').val();
		var d = new Date();
		var n = d.getTime();

		// alert(txt);

		Liferay.fire('MY_AJAX_EVENT', {
			userData : {
				Text : txt,
				Time : n
			}
		});

	});

});