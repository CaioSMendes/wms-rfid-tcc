class AddAddressToClient < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :address, null: false, foreign_key: true
  end
end
