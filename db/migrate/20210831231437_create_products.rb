class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.string :unity
      t.decimal :price, precision: 5, scale: 2
      t.date :date
      t.string :productCode
      t.string :gtin
      t.string :rfid
      t.integer :productMin
      t.integer :productMax
      t.decimal :salePrice, precision: 5, scale: 2
      t.decimal :saleCost, precision: 5, scale: 2
      t.string :avaliable

      t.timestamps
    end
  end
end
