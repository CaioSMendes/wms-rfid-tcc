class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.float :price
      t.integer :quantity
      t.string :nameProduct
      t.date :dateBuy
      t.float :discount
      t.float :measurement
      t.text :description
      t.float :ipi
      t.float :icms
      t.float :shipping
      t.float :costAdd

      t.timestamps
    end
  end
end
