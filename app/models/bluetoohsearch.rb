class Bluetoohsearch < ApplicationRecord
    belongs_to :product,  dependent: :destroy
    
end
