class AddSellToWallet < ActiveRecord::Migration[6.0]
  def change
    add_reference :wallets, :sell, null: false, foreign_key: true
  end
end
