class Order < ApplicationRecord
  belongs_to :shipping_address, class_name: 'Address', optional: true
  belongs_to :billing_address, class_name: 'Address', optional: true
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  validates :shipping_address_id, presence: true

  accepts_nested_attributes_for :shipping_address
  accepts_nested_attributes_for :billing_address

  before_save :update_financials

  def calculate_subtotal
    order_items.sum { |item| item.unit_price * item.quantity }
  end

  def calculate_tax
    TaxRate.calculate_for(self)
  end

  def calculate_total
    subtotal + tax
  end

  private

  def calculate_financials
    self.tax = calculate_tax
    self.subtotal = calculate_subtotal
    self.total = calculate_total
  end

  def update_financials
    self.subtotal = calculate_subtotal
    self.tax = calculate_tax
    self.total = subtotal + tax
  end

end