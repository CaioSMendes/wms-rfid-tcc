class Product < ApplicationRecord
    belongs_to :categorie
    belongs_to :provider
    has_one_attached :image

    accepts_nested_attributes_for :categorie
    accepts_nested_attributes_for :provider


    validates :name, :quantity, :unity, :price, :rfid, :saleCost, presence: true
end
