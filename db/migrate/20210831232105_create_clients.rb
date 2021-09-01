class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :corporateName
      t.string :fantasyName
      t.string :name
      t.string :phone
      t.string :cnpj
      t.string :email
      t.string :codeClient

      t.timestamps
    end
  end
end
