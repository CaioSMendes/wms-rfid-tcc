class AddAddressToProvider < ActiveRecord::Migration[6.0]
  def change
    add_reference :providers, :address, null: false, foreign_key: true
  end
end
