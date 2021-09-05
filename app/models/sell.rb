class Sell < ApplicationRecord
    belongs_to :product
    belongs_to :client
    belongs_to :tax

    accepts_nested_attributes_for :tax
    validates :price, :quantity, presence: true

    def self.total
        self.sum(:price)
    end
end
