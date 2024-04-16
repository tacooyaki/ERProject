
AdminUser.create!(email: 'admin@example.com', password: 'password',
                  password_confirmation: 'password') if Rails.env.development?

tax_rates = [
  { province: "Ontario", gst: 5, pst: 8, hst: 0 },
  { province: "British Columbia", gst: 5, pst: 7, hst: 0 },
  { province: "Nova Scotia", gst: 0, pst: 0, hst: 15 }
]

tax_rates.each do |rate|
  TaxRate.find_or_create_by(province: rate[:province]) do |tr|
    tr.gst = rate[:gst]
    tr.pst = rate[:pst]
    tr.hst = rate[:hst]
  end
end