class BankAccount < ApplicationRecord
  belongs_to :bankable, polymorphic: true
  belongs_to :bank_account_type
end
