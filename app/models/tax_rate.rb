class TaxRate < ApplicationRecord

  validates :province, presence: true, uniqueness: true
  validates :gst, :pst, :hst, numericality: true

  def self.calculate_for(order)
    return 0 unless order.shipping_address
    tax_rate = find_by(province: order.shipping_address.province)
    tax_rate ? order.subtotal * ((tax_rate.gst + tax_rate.pst + tax_rate.hst) / 100) : 0
  end

end
