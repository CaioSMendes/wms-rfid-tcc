class AddProviderToBuy < ActiveRecord::Migration[6.0]
  def change
    add_reference :buys, :provider, null: false, foreign_key: true
  end
end
