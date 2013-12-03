// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function initialize() {
	  		var myLatlng = new google.maps.LatLng(33.746082, -84.373374);
  			var map_canvas = document.getElementById('map_canvas');
  			var map_options = {
			    center: myLatlng,
			    zoom: 14,
			    mapTypeId: google.maps.MapTypeId.ROADMAP
		  	}
			  var map = new google.maps.Map(map_canvas, map_options)

			  var marker = new google.maps.Marker({
			  	position: myLatlng,
			  	map: map,
			  	title:"Hellow World!"
			  });
			}
			google.maps.event.addDomListener(window, 'load', initialize);

$(document).ready(function () {

	//$('.quantity').val('Put number!')
	$(document).on('click', '#toggle_cart_button', function () {

		var display = $('#cart_detail_panel').css('display');
		if (display == "none"){
			//$(this).val('View');
			$('#cart_detail_panel').slideDown();
		}else{
			//$(this).val('Hide');
			$('#cart_detail_panel').slideUp();
			//or: change CSS value dot css display block -> none
		}
	});


	$('.add-to-cart-button').click(function () { 
		var value = $(this).siblings('.quantity').val();

		var value_int = parseInt(value);

		//var product_id = $(this).siblings('.product-id').val();
		var product_id = $(this).data('product-id');
		var product_name = $(this).data('product-name');
		var price = $(this).data('price');
		//alert(price);

		if(value_int > 0){
			//Make an AJAX call
			$.post('/store/add_cart', {
				quantity : value_int,
				product_id : product_id,
				product_name : product_name,
				price : price
			});
			//alert('I am shown!');

		}else{
			alert('C\'mon. Don\'t be like that.')
		}
	});
});