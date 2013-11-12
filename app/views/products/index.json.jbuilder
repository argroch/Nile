json.array!(@products) do |product|
  json.extract! product, :name, :unit_price, :description, :quantity, :sku, :brand, :model_num
  json.url product_url(product, format: :json)
end
