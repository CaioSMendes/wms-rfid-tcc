class Product < ApplicationRecord
    belongs_to :categorie
    belongs_to :provider
    has_one_attached :image

    validates :name, :quantity, :unity, :price, :rfid, :salePrice, :saleCost, presence: true
end
