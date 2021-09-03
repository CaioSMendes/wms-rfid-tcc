class AddCategorieToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :categorie, foreign_key: true
  end
end
