class Categorie < ApplicationRecord
    has_many :products
    validates :nameCat, presence: true
end