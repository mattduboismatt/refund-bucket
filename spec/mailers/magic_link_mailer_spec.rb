require "rails_helper"

RSpec.describe MagicLinkMailer do
  describe "#magic_link" do
    let(:user) { create(:user) }
    let(:token) { Faker::Alphanumeric.alpha(number: 10) }
    let(:redirect_path) { "/fake/path" }
    let(:params) do
      {
        user: user,
        token: token,
        redirect_path: redirect_path
      }
    end
    let(:mail) { described_class.with(params).magic_link }

    it "sends the email" do
      expect { mail.deliver_now }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end

    it "renders the headers" do
      expect(mail.subject).to eq("RefundBucket - your magic link")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["service@refundbucket.com"])
    end

    it "renders a link to the authentication url with token" do
      auth_path = "/magic_link_emails/authenticate"
      token_param = "token=#{token}"
      expect(mail.body.encoded).to match auth_path
      expect(mail.body.encoded).to match token_param
    end
  end
end
