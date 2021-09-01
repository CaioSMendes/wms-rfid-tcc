class Provider < ApplicationRecord
    belongs_to :address
    accepts_nested_attributes_for :address


    validates :corporateName, :fantasyName, :phone, :cnpj, :email, presence: true
end
