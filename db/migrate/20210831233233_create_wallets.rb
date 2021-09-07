class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.decimal :buy, precision: 5, scale: 2
      t.decimal :sell, precision: 5, scale: 2
      t.decimal :total, precision: 5, scale: 2

      t.timestamps
    end
  end
end
