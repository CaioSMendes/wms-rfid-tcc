class Client < ApplicationRecord
    belongs_to :address
    accepts_nested_attributes_for :address

    validates :corporateName, :name, :phone, :cnpj, :email, presence: true
end

