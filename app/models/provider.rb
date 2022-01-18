class Provider < ApplicationRecord
    belongs_to :address
    has_many :buys, dependent: :delete_all #certo
    accepts_nested_attributes_for :address


    validates :corporateName, :proprietaryName, :phone, :cnpj, :email, presence: true
end
