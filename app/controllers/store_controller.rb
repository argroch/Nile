class StoreController < ApplicationController

  def index

    @categories = Category.order('name asc')

    category_name = params[:category_name]
    if category_name.blank?
      @products = Product.all
    else
      @products = Category.find_by_name(category_name).products
    end

  	if session[:cart].nil?
  		session[:cart] = {}
  	end
  	@cart = session[:cart]
    #session.clear

    @sum = Cart.sum_total(@cart)

  end

  def add_cart
  	product_id = params[:product_id].to_i
  	quantity = params[:quantity].to_i
    @product_name = params[:product_name]
    price = params[:price].to_f

  	line_item = { product_id: product_id, quantity: quantity}
  	
  	if session[:cart].nil?
  		session[:cart] = {}
  	end

		current_cart = session[:cart]
  	
  	if current_cart[product_id].nil?
  		current_cart[product_id] = [quantity, @product_name, price]
  	else
  		value_array = current_cart[product_id]
      old_quantity = value_array[0]
      new_quantity = old_quantity + quantity
  		current_cart[product_id] = [new_quantity, @product_name, price]
  	end

  	@cart = current_cart

  	Rails.logger.info "CART= #{session[:cart]}"

    @sum = Cart.sum_total(@cart)
	end

  def delete_item

  end
  
end