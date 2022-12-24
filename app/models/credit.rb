class Credit < ApplicationRecord
  belongs_to :user
  belongs_to :dealer, optional: true

  METHODS = ["credit / refund", "redemption code", "gift card"]

  validates :amount, presence: true, numericality: {greater_than: 0}
  validates :method, inclusion: {in: METHODS, message: "%{value} is not a valid method"}
end
