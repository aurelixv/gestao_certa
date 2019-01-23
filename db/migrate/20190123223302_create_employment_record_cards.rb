class CreateEmploymentRecordCards < ActiveRecord::Migration[5.2]
  def change
    create_table :employment_record_cards do |t|
      t.string :pis_pasep,  null: false
      t.string :number,     null: false
      t.string :series,     null: false
      t.string :state,      null: false

      t.timestamps
    end
  end
end
