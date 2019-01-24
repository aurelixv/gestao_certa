class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name,     null: false
      t.string :rg,       null: false
      t.string :cpf,      null: false
      t.string :email,    null: false
      t.date :birth_date, null: false
      t.string :phone,    null: false

      t.timestamps
    end
  end
end
