class Buy < ApplicationRecord
    #belongs_to :product
    belongs_to :provider
    belongs_to :tax
    
    accepts_nested_attributes_for :tax
    validates :price, :quantity, presence: true

    def self.total
        self.sum(:price)
    end

    def self.totalbuy
        #self.price * self.quantity
       values = Buy.all.map{|buy| buy.price * buy.quantity}
       values.reduce(:+)
   end 
end
