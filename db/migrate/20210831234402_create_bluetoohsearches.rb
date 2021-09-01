class CreateBluetoohsearches < ActiveRecord::Migration[6.0]
  def change
    create_table :bluetoohsearches do |t|
      t.string :rfidCode

      t.timestamps
    end
  end
end
