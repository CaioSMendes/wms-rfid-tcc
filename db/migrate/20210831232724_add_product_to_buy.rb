class AddProductToBuy < ActiveRecord::Migration[6.0]
  def change
    add_reference :buys, :product, null: false, foreign_key: true
  end
end
