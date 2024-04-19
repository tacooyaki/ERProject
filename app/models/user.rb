class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :addresses

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name email created_at updated_at]
  end
end
