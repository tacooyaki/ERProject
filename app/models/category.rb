class Category < ApplicationRecord
  has_many :products

  def self.ransackable_associations(_auth_object = nil)
    %w[products]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name created_at updated_at]
  end

end
