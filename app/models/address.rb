class Address < ApplicationRecord
  belongs_to :user, optional: true
  def full_address
    [street, city, province, postal_code, country].compact.join(', ')
  end
end