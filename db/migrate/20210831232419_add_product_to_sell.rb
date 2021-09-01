class AddProductToSell < ActiveRecord::Migration[6.0]
  def change
    add_reference :sells, :product, null: false, foreign_key: true
  end
end
