class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.string :neighborhood
      t.string :number
      t.string :complement
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
