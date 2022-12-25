require "rails_helper"

EXCLUDED_FACTORIES = []

FactoryBot.factories.map(&:name).each do |factory_name|
  next if EXCLUDED_FACTORIES.include?(factory_name)

  RSpec.describe "#{factory_name.to_s.classify} factory" do
    subject { build factory_name }
    it { expect { subject }.not_to raise_error }

    it "builds valid models" do
      subject.validate
      expect(subject.errors.full_messages).to be_blank
      expect { subject.save! }.not_to raise_error
    end
  end
end
