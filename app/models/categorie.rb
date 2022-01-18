class Categorie < ApplicationRecord
    has_many :products, dependent: :delete_all #certo
    #belongs_to :products #errado
    validates :nameCat, presence: true
end