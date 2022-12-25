require "rails_helper"

RSpec.describe Dealer do
  describe "validations" do
    subject { build :dealer }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_uniqueness_of :slug }
    it { is_expected.to validate_inclusion_of(:category).in_array(described_class::CATEGORIES).with_message(/is not a valid category/) }
  end
end
