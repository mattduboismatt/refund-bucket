require "rails_helper"

RSpec.describe Dealer do
  describe "validations" do
    subject { build :dealer }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_uniqueness_of :slug }
    it { is_expected.to validate_inclusion_of(:category).in_array(described_class::Categories::ALL).with_message(/is not a valid category/) }
  end

  describe ".search" do
    subject { described_class }
    let(:dealer_airline_z11) { create(:dealer, :airline, name: "Zzz", credits_count: 11) }
    let(:dealer_airline_z22) { create(:dealer, :airline, name: "zzz", credits_count: 22) }
    let(:dealer_airline_a20) { create(:dealer, :airline, name: "Aaa", credits_count: 20) }
    let(:dealer_hotel_b33) { create(:dealer, :hotel, name: "Bbb", credits_count: 33) }
    let(:all_dealers) {
      [
        dealer_airline_z11,
        dealer_airline_z22,
        dealer_airline_a20,
        dealer_hotel_b33
      ].sort_by(&:id)
    }

    it "returns all sorted by ID" do
      expect(subject.search).to eq all_dealers
    end

    it "filters by name case insensitively" do
      expect(subject.search(name: "ZZZ")).to contain_exactly(dealer_airline_z11, dealer_airline_z22)
    end

    it "filters by category" do
      expect(subject.search(category: subject::Categories::AIRLINE)).to contain_exactly(dealer_airline_a20, dealer_airline_z11, dealer_airline_z22)
    end

    it "sorts by name ascending" do
      expect(subject.search(sort: "name")).to eq([dealer_airline_a20, dealer_hotel_b33, dealer_airline_z11, dealer_airline_z22])
    end

    it "sorts by credits count descending" do
      expect(subject.search(sort: "credits_count")).to eq([dealer_hotel_b33, dealer_airline_z22, dealer_airline_a20, dealer_airline_z11])
    end
  end
end
