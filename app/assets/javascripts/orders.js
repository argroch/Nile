// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function () {
	$('.order-history-table .order-detail').click(function() {

		var order_id = $(this).data('id');
		$('#contact_info_' + order_id).slideDown();
	});
});