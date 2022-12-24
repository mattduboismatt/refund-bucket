class User < ApplicationRecord
  has_many :credits, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
