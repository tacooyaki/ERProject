AdminUser.find_or_create_by(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
end

tax_rates = [
  { province: "Alberta", gst: 5, pst: 0, hst: 0 },
  { province: "British Columbia", gst: 5, pst: 7, hst: 0 },
  { province: "Manitoba", gst: 5, pst: 7, hst: 0 },
  { province: "New Brunswick", gst: 0, pst: 0, hst: 15 },
  { province: "Newfoundland and Labrador", gst: 0, pst: 0, hst: 15 },
  { province: "Northwest Territories", gst: 5, pst: 0, hst: 0 },
  { province: "Nova Scotia", gst: 0, pst: 0, hst: 15 },
  { province: "Nunavut", gst: 5, pst: 0, hst: 0 },
  { province: "Ontario", gst: 0, pst: 0, hst: 13 },
  { province: "Prince Edward Island", gst: 0, pst: 0, hst: 15 },
  { province: "Quebec", gst: 5, pst: 9.975, hst: 0 },
  { province: "Saskatchewan", gst: 5, pst: 6, hst: 0 },
  { province: "Yukon", gst: 5, pst: 0, hst: 0 }
]

tax_rates.each do |rate|
  TaxRate.find_or_create_by(province: rate[:province]) do |tr|
    tr.gst = rate[:gst]
    tr.pst = rate[:pst]
    tr.hst = rate[:hst]
  end
end