class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.date :start_date, null: false
      t.date :end_date
      t.references :employment_record_card, foreign_key: true
      t.references :address, foreign_key: true
      t.references :bank_account, foreign_key: true
      t.references :person, foreign_key: true
      t.references :employee_type, foreign_key: true

      t.timestamps
    end
  end
end
