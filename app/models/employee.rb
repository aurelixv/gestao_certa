class Employee < ApplicationRecord
  belongs_to :person
  belongs_to :employee_type

  has_one :employment_record_card
  has_one :address, as: :addressable
  has_one :bank_account, as: :bankable

  accepts_nested_attributes_for :employment_record_card
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :bank_account
  accepts_nested_attributes_for :person

  default_scope { order(:created_at) }

  def name
    person.name
  end

  def type
    employee_type.title
  end


  def self.build
    obj = Employee.new
    obj.build_address
    obj.build_bank_account
    obj.build_employment_record_card
    obj.build_person
    obj
  end
end
