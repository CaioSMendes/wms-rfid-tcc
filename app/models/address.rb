class Address < ApplicationRecord
    validates :street, :neighborhood, :city, :number, :state, presence: true
end
