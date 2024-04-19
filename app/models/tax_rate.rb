class TaxRate < ApplicationRecord
  validates :province, presence: true, uniqueness: true
  validates :gst, :pst, :hst, numericality: true

  def self.calculate_for(order)
    return 0 unless order.shipping_address
    tax_rate = find_by(province: order.shipping_address.province)

    Rails.logger.debug "Calculating tax for order: "
    Rails.logger.debug "Shipping Address Province: #{order.shipping_address.province}"
    if tax_rate && order.subtotal.present?
      Rails.logger.debug "Tax Rates Found - GST: #{tax_rate.gst}, PST: #{tax_rate.pst}, HST: #{tax_rate.hst}"
      order.subtotal * ((tax_rate.gst + tax_rate.pst + tax_rate.hst) / 100)
    else
      Rails.logger.debug "No tax rate found for province: #{order.shipping_address.province}. Tax set to 0."
      0
    end
  end
end
