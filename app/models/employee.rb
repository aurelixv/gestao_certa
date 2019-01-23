class Employee < ApplicationRecord
  belongs_to :employment_record_card
  belongs_to :address
  belongs_to :bank_account
  belongs_to :person
  belongs_to :employee_type
end
