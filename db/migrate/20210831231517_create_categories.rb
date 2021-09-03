class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :nameCat
      t.string :codCategorie

      t.timestamps
    end
  end
end
