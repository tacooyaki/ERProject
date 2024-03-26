class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :category
  has_many :order_items

  def self.ransackable_associations(_auth_object = nil)
    %w[category order_items]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name description price category_id created_at updated_at]
  end

end
