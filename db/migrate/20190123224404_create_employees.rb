class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :archived, dafault: false
      t.references :person, foreign_key: true
      t.references :employee_type, foreign_key: true

      t.timestamps
    end
  end
end
