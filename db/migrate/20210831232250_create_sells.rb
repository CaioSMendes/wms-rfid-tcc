class CreateSells < ActiveRecord::Migration[6.0]
  def change
    create_table :sells do |t|
      t.decimal :price, precision: 5, scale: 2
      t.decimal :totsell, precision: 5, scale: 2
      t.integer :quantity
      t.string :nameProduct
      t.float :discount
      t.string :measurement
      t.text :description

      t.timestamps
    end
  end
end
