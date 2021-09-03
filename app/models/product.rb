class Product < ApplicationRecord
    belongs_to :categorie #certo
    #has_many :categories
    #belongs_to :provider
    has_one_attached :image

    #accepts_nested_attributes_for :categorie
    #accepts_nested_attributes_for :provider


    validates :name, :quantity, :unity, :salePrice, :rfid, :saleCost, presence: true
end
