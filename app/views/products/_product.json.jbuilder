json.extract! product, :id, :product_type, :product_name, :product_price, :product_discount, :product_discription, :created_at, :updated_at
json.url product_url(product, format: :json)