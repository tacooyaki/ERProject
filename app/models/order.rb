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
    order_items.sum { |item| (item.unit_price || 0) * (item.quantity || 0) }
  end

  def calculate_tax
    TaxRate.calculate_for(self)
  end

  def calculate_total
    subtotal + tax
  end

  def calculate_financials
    Rails.logger.debug "Calculating subtotal..."
    self.subtotal = calculate_subtotal
    Rails.logger.debug "Subtotal calculated: #{subtotal}"

    Rails.logger.debug "Calculating tax..."
    self.tax = calculate_tax
    Rails.logger.debug "Tax calculated: #{tax}"

    Rails.logger.debug "Calculating total..."
    self.total = calculate_total
    Rails.logger.debug "Total calculated: #{total}"
  end

  private

  def update_financials
    self.subtotal = calculate_subtotal
    self.tax = calculate_tax
    self.total = subtotal + tax
  end

end