class AddTaxToSell < ActiveRecord::Migration[6.0]
  def change
    add_reference :sells, :tax, null: false, foreign_key: true
  end
end
