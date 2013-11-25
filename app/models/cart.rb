class Cart

	def self.sum_total(cart)
    sum = 0
    cart.each do |key, value|
      qty = value[0]
      price = value[2]
      total = qty * price
      sum = sum + total
  	end
  	return sum
  end

end