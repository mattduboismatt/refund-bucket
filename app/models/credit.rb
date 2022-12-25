class Credit < ApplicationRecord
  belongs_to :user
  belongs_to :dealer, optional: true

  METHODS = ["credit / refund", "redemption code", "gift card"]

  validates :method, inclusion: {in: METHODS, message: "%{value} is not a valid method", allow_nil: true}
  validates :redeemed, inclusion: {in: [true, false], message: "%{value} is not valid for redeemed"}
  validates :never_expires, inclusion: {in: [true, false], message: "%{value} is not valid for never_expires"}

  monetize :amount_cents, numericality: {greater_than: 0}
end
