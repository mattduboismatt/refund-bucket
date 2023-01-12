class Credit < ApplicationRecord
  self.implicit_order_column = :created_at

  belongs_to :user, counter_cache: true
  belongs_to :dealer, counter_cache: true, optional: true

  METHODS = ["credit / refund", "redemption code", "gift card"]

  validates :method, inclusion: {in: METHODS, message: "%{value} is not a valid method", allow_nil: true}
  validates :redeemed, inclusion: {in: [true, false], message: "%{value} is not valid for redeemed"}
  validates :never_expires, inclusion: {in: [true, false], message: "%{value} is not valid for never_expires"}

  monetize :amount_cents, numericality: {greater_than: 0}

  scope :redeemed, -> { where(redeemed: true) }
  scope :unredeemed, -> { where(redeemed: false) }

  def self.stats_for(user)
    user.credits.unredeemed.map(&:amount)
  end
end
