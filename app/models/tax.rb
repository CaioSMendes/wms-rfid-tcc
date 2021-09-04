class Tax < ApplicationRecord
    #belongs_to :buy
    #belongs_to :sell
    has_many :buy 
    has_many :sell 

    #has_many :buys #certo
end
