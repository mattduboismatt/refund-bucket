require "rails_helper"

RSpec.describe Credit do
  describe "associations" do
    subject { build :credit }

    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to(:dealer).optional(true) }
  end

  describe "validations" do
    subject { build :credit }

    it { is_expected.to monetize(:amount) }
    it { is_expected.to validate_inclusion_of(:method).in_array(described_class::METHODS).with_message(/is not a valid method/).allow_nil }
  end
end
