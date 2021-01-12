class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.text :address_line
      t.string :street
      t.string :landmark
      t.string :city
      t.string :state
      t.string :pincode

      t.timestamps
    end
  end
end
