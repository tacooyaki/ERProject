class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :category
  has_many :order_items

  scope :on_sale, -> { where(is_on_sale: true) }
  scope :recently_added, -> { order(created_at: :desc) }
  scope :recently_updated, -> { order(updated_at: :desc) }


  def self.ransackable_associations(_auth_object = nil)
    %w[category order_items]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name description price category_id created_at updated_at]
  end

end
