class CreateTaxes < ActiveRecord::Migration[6.0]
  def change
    create_table :taxes do |t|
      t.float :shipping
      t.float :costAdd
      t.float :ipi
      t.float :icms
      t.text :description

      t.timestamps
    end
  end
end
