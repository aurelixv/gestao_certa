class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :zip_code, length: { is: 9 }, format: { with: /\A\d{5}-\d{3}\z/ }
end
