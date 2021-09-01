class Sell < ApplicationRecord
    belongs_to :product
    belongs_to :client
    belongs_to :tax

    validates :price, :quantity, presence: true
end
