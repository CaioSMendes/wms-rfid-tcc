json.extract! product, :id, :name, :description, :quantity, :unity, :price, :date, :productCode, :gtin, :rfid, :productMin, :productMax, :salePrice, :saleCost, :avaliable, :created_at, :updated_at
json.url product_url(product, format: :json)
