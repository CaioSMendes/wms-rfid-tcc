class AddTaxToBuy < ActiveRecord::Migration[6.0]
  def change
    add_reference :buys, :tax, null: false, foreign_key: true
  end
end
