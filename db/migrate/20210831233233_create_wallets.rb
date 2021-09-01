class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.float :buy
      t.float :sell
      t.float :total

      t.timestamps
    end
  end
end
