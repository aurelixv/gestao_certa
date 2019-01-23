class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street,   null: false
      t.string :zip_code, null: false
      t.string :number,   null: false
      t.string :district, null: false
      t.string :city,     null: false
      t.string :state,    null: false

      t.timestamps
    end
  end
end
