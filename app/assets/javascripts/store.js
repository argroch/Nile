// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function () {

	//$('.quantity').val('Put number!')


	$('.add-to-cart-button').click(function () { 
		var value = $(this).siblings('.quantity').val();

		var value_int = parseInt(value);

		//var product_id = $(this).siblings('.product-id').val();
		var product_id = $(this).data('product-id');

		if(value_int > 0){
			//Make an AJAX call
			$.post('/store/add_cart', {
				quantity : value_int,
				product_id : product_id
			});

		}else{
			alert('C\'mon. Don\'t be like that.')
		}
	});
});