class Tax < ApplicationRecord
    belongs_to :buy
    belongs_to :sell
end
