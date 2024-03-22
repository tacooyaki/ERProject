class StaticPage < ApplicationRecord
  has_rich_text :content

  # Added empty array as it is not needed to be searchable via Ransack.
  def self.ransackable_associations(_auth_object = nil)
    []
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[title slug]
  end
end
