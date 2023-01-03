class Dealer < ApplicationRecord
  CATEGORIES = ["airline", "hotel", "car rental", "e-commerce"]

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :category, inclusion: {in: CATEGORIES, message: "%{value} is not a valid category"}

  scope :with_name, ->(name) { where("lower(name) LIKE ?", "%#{name.downcase}%") if name.present? }
  scope :with_category, ->(category) { where(category: category) if category.present? }

  def self.search(params = {})
    sort_column = params[:sort].presence_in(["name", "credits_count"]) || "id"
    sort_direction = (sort_column == "credits_count") ? :desc : :asc

    with_name(params[:name])
      .with_category(params[:category])
      .order(sort_column => sort_direction)
  end
end
