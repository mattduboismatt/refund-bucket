class Dealer < ApplicationRecord
  CATEGORIES = ["airline", "hotel", "car rental", "e-commerce"]

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not a valid category" }
end
