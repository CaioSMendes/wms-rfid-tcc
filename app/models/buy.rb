class Buy < ApplicationRecord
    belongs_to :product
    belongs_to :provider
    belongs_to :tax

    validates :price, :quantity, presence: true
end
