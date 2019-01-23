class CreateBankAccountTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_account_types do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
