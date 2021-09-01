class AddProductToBluetoohsearch < ActiveRecord::Migration[6.0]
  def change
    add_reference :bluetoohsearches, :product, null: false, foreign_key: true
  end
end
