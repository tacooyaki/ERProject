class Order < ApplicationRecord
  belongs_to :shipping_address, class_name: 'Address', optional: true
  belongs_to :billing_address, class_name: 'Address', optional: true
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  accepts_nested_attributes_for :shipping_address
  accepts_nested_attributes_for :billing_address

  before_save :update_financials

  # private

  def update_financials
    self.subtotal = calculate_subtotal
    self.tax = calculate_tax
    self.total = subtotal + tax
  end

  def calculate_subtotal
    order_items.sum { |item| item.unit_price * item.quantity }
  end

  def calculate_tax
    tax_rate = TaxRate.find_by(province: shipping_address&.province)
    if tax_rate
      subtotal * ((tax_rate.gst + tax_rate.pst + tax_rate.hst) / 100)
    else
      0
    end
  end

  def calculate_total
    subtotal + tax
  end
end