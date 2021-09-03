class Categorie < ApplicationRecord
    has_many :products #certo
    #belongs_to :products #errado
    validates :nameCat, presence: true
end