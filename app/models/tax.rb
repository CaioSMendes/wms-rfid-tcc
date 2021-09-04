class Tax < ApplicationRecord
    #belongs_to :buy
    #belongs_to :sell
    has_many :sells
    #has_many :buys #certo
end
