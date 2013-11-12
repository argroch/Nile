json.array!(@customers) do |customer|
  json.extract! customer, :name, :phone, :email, :address1, :address2, :city, :state, :zip
  json.url customer_url(customer, format: :json)
end
