class Order < ActiveRecord::Base

	belongs_to :customer
	has_many :line_items


	CURRENT_SALES_TAX = 0.06

	def self.process_order(customer, current_cart)
		order = Order.new
    order.customer_id = customer.id

    sub_total = Cart.sum_total(current_cart)

    order.sub_total = sub_total
    order.sales_tax = sub_total * CURRENT_SALES_TAX
    order.grand_total = order.sub_total + order.sales_tax

    if order.save  
      current_cart.each do |key, item|
        line_item = LineItem.new
        line_item.product_id = key
        line_item.quantity = item[0]
        line_item.unit_price = item[2]
        line_item.line_item_total = line_item.quantity * line_item.unit_price
        line_item.order_id = order.id
    		if line_item.save
          product = Product.find(line_item.product_id);
	        product.quantity -= line_item.quantity;
	        product.save
      	end
      end
      Notifier.order_confirmation_email(customer).deliver
    end
    return order
	end


end
