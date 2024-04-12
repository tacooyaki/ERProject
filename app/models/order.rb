class Order < ApplicationRecord
  belongs_to :shipping_address, class_name: 'Address', optional: true
  belongs_to :billing_address, class_name: 'Address', optional: true
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items
  accepts_nested_attributes_for :shipping_address
  accepts_nested_attributes_for :billing_address
end