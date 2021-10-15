class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :company, :string
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :cpf, :string
  end
end
