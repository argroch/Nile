class StoreController < ApplicationController
  def index
  	@products = Product.all
  	@categories = Category.all

  	if session[:cart].nil?
  		session[:cart] = {}
  	end
  	@cart = session[:cart]
  	#session.clear
  end

  def add_cart
  	product_id = params[:product_id].to_i
  	quantity = params[:quantity].to_i

  	line_item = { product_id: product_id, quantity: quantity}
  	
  	if session[:cart].nil?
  		session[:cart] = {}
  	end

		current_cart = session[:cart]
  	
  	if current_cart[product_id].nil?
  		current_cart[product_id] = quantity
  	else
  		old_quantity = current_cart[product_id]
  		current_cart[product_id] = old_quantity + quantity
  	end

  	@cart = current_cart
  	Rails.logger.info "CART= #{session[:cart]}"
	end
end