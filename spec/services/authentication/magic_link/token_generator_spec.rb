require "rails_helper"

module Authentication
  module MagicLink
    RSpec.describe TokenGenerator do
      describe ".call" do
        subject { described_class }

        context "when user has an auth token expiring in the future" do
          it "returns the auth token" do
            token = SecureRandom.urlsafe_base64
            user = create(:user, auth_token: token, auth_token_expires_at: 10.seconds.from_now)
            expect(subject.call(user)).to eq token
          end
        end

        context "when user does not have an auth token" do
          it "updates the user with a new auth token" do
            user = create(:user, auth_token: nil, auth_token_expires_at: nil)
            expect(subject.call(user)).to be_present
            user.reload
            expect(user.auth_token).to be_present
            expect(user.auth_token_expires_at).to be_future
          end
        end

        context "when user has an auth token but it expired in the past" do
          it "updates the user with a new auth token" do
            stale_token = Faker::Alphanumeric.alpha(number: 10)
            user = create(:user, auth_token: stale_token, auth_token_expires_at: 10.seconds.ago)
            expect(subject.call(user)).to be_present
            user.reload
            expect(user.auth_token).to be_present
            expect(user.auth_token).to_not eq stale_token
            expect(user.auth_token_expires_at).to be_future
          end
        end
      end
    end
  end
end
