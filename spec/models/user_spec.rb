require "rails_helper"

RSpec.describe User do
  describe "associations" do
    subject { build :user }

    it { is_expected.to have_many :credits }
  end

  describe "validations" do
    subject { build :user }

    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
  end
end
