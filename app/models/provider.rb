class Provider < ApplicationRecord
    belongs_to :address

    validates :corporateName, :fantasyName, :phone, :cnpj, :email, presence: true
end
