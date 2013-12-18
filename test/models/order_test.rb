require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "sales_tax" do
  	result = Order.sales_tax
    assert_equal 6, result
	end

	test "process order with 1 item" do
		cart = {1 => [10, "Product Name", 8.99]}

		customer = customers(:one)

		order = Order.process_order(customer, cart)

		order_count = Order.where(:customer_id => customer.id).count
		assert_equal 3, order_count
		assert_equal 1, order.line_items.count
	end
end
