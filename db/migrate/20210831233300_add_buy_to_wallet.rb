class AddBuyToWallet < ActiveRecord::Migration[6.0]
  def change
    add_reference :wallets, :buy, null: false, foreign_key: true
  end
end
