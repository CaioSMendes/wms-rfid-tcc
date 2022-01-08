class Provider < ApplicationRecord
    belongs_to :address
    has_many :buys #certo
    accepts_nested_attributes_for :address


    validates :corporateName, :proprietaryName, :phone, :cnpj, :email, presence: true
end
