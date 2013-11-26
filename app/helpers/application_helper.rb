module ApplicationHelper

	def full_address(customer)
		address = customer.address1
		
		if ! customer.address2.blank?	
			address += " " + customer.address2
		end	
			#also can use "unless" instead of "if !"

		address += "<br />" + customer.city
		address += ", " + customer.state
		address += " " + customer.zip
		#return address <- don't have to do in Ruby
		#if thelast line is what you want returned.
  end

end
