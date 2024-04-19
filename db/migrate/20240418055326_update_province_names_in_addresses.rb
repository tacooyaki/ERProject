class UpdateProvinceNamesInAddresses < ActiveRecord::Migration[7.1]
  PROVINCE_ABBREVIATIONS_TO_FULL = {
    'MB' => 'Manitoba',
    'BC' => 'British Columbia',
    'AB' => 'Alberta',
    'SK' => 'Saskatchewan',
    'ON' => 'Ontario',
    'QC' => 'Quebec',
    'NS' => 'Nova Scotia',
    'NB' => 'New Brunswick',
    'PE' => 'Prince Edward Island',
    'NL' => 'Newfoundland and Labrador',
    'NT' => 'Northwest Territories',
    'YT' => 'Yukon',
    'NU' => 'Nunavut'
  }

  def up
    Address.find_each do |address|
      new_province = PROVINCE_ABBREVIATIONS_TO_FULL[address.province]
      address.update(province: new_province) if new_province
    end
  end

  def down
    Address.find_each do |address|
      PROVINCE_ABBREVIATIONS_TO_FULL.each do |abbr, full|
        address.update(province: abbr) if address.province == full
      end
    end
  end
end