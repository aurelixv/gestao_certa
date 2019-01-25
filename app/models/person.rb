class Person < ApplicationRecord
  has_one :employee

  validates :rg,    length: { is: 11 }, format: { with: /\A\d{1}.\d{3}.\d{3}-\d{1}\z/ }
  validates :cpf,   cpf: true
  validates :phone, format: { with: /\A\(\d{2}\)\d{5}-\d{4}\z/ }
  validates :email, email: true
end
