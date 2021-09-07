class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.decimal :price, precision: 5, scale: 2
      t.decimal :totbuy, precision: 5, scale: 2
      t.integer :quantity
      t.string :nameProduct
      t.date :dateBuy
      t.float :discount
      t.string :measurement
      t.text :description

      t.timestamps
    end
  end
end