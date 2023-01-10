require "rails_helper"

module Authentication
  module MagicLink
    RSpec.describe EmailSender do
      describe ".call" do
        subject { described_class.call(email: email, redirect_path: redirect_path) }

        let(:token) { SecureRandom.urlsafe_base64 }
        let(:email) { Faker::Internet.email }
        let(:redirect_path) { Faker::Internet.url }

        before do
          allow(TokenGenerator).to receive(:call).and_return(token)
        end

        context "when user is not found by email" do
          it "creates the user with email field" do
            expect { subject }.to change(User, :count).from(0).to(1)
            user = User.last
            expect(user.email).to eq email
          end
        end

        context "when user is not found by email" do
          it "does not create a new user" do
            create(:user, email: email)
            expect { subject }.to_not change(User, :count)
          end
        end

        it "calls the token generator service" do
          subject
          expect(TokenGenerator).to have_received(:call).with(User)
        end

        it "passes the user, token, and redirect path to the mailer" do
          params = {
            user: create(:user, email: email),
            token: token,
            redirect_path: redirect_path
          }
          expect { subject }
            .to have_enqueued_mail(MagicLinkMailer, :magic_link)
            .with(
              a_hash_including(params: params, args: [])
            )
        end
      end
    end
  end
end
