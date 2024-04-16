class TaxRate < ApplicationRecord

  validates :province, presence: true, uniqueness: true
  validates :gst, :pst, :hst, numericality: true
end
