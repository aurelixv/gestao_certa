class CreateBankAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_accounts do |t|
      t.string :name,   null: false
      t.string :branch, null: false
      t.string :number, null: false
      t.references :bank_account_type, foreign_key: true

      t.timestamps
    end
  end
end
