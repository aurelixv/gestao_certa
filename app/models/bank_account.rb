class BankAccount < ApplicationRecord
  belongs_to :bank_account_type

  has_one :employee
end
