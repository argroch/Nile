json.array!(@storefronts) do |storefront|
  json.extract! storefront, 
  json.url storefront_url(storefront, format: :json)
end
