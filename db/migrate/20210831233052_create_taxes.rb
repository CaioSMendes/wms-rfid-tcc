class CreateTaxes < ActiveRecord::Migration[6.0]
  def change
    create_table :taxes do |t|
      t.decimal :shipping, precision: 5, scale: 2
      t.decimal :costAdd, precision: 5, scale: 2
      t.decimal :ipi, precision: 5, scale: 2
      t.decimal :icms, precision: 5, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
