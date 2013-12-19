class OrdersController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@categories = Category.order('name asc')
  	@orders = Order.order('id desc')
  end

end
