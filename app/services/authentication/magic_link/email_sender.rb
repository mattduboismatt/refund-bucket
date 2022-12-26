module Authentication
  module MagicLink
    class EmailSender < ApplicationService
      def initialize(email:, redirect_path:)
        @email = email
        @redirect_path = redirect_path
      end

      def call
        user = User.find_or_create_by!(email: @email.strip.downcase)
        token = TokenGenerator.call(user)
        MagicLinkMailer.with(
          user: user,
          token: token,
          redirect_path: @redirect_path
        ).magic_link.deliver_later
      end
    end
  end
end
