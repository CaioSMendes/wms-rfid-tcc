class CreateSells < ActiveRecord::Migration[6.0]
  def change
    create_table :sells do |t|
      t.float :price
      t.integer :quantity
      t.string :nameProduct
      t.date :dataSell
      t.float :discount
      t.string :measurement
      t.text :description

      t.timestamps
    end
  end
end
