class Client < ApplicationRecord
    belongs_to :address
    has_many :sells
    accepts_nested_attributes_for :address

    validates :corporateName, :name, :phone, :cnpj, :email, presence: true

    
end

