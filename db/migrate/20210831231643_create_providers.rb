class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :corporateName
      t.string :proprietaryName
      t.string :phone
      t.string :cnpj
      t.string :stateRegistration
      t.string :email
      t.string :business
      t.string :codeProvider

      t.timestamps
    end
  end
end
