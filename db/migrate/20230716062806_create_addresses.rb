class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :customer, foreign_key: true, null: false
      t.string :name, null: false
      t.string :postcode, null: false
      t.string :address, null: false
 
      t.timestamps
    end
  end
end
