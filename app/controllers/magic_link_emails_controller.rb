class MagicLinkEmailsController < ApplicationController
  allow_unauthenticated!

  def new
    @redirect_path = params[:redirect_path]
  end

  def create
    Rails.logger.info("Processing magic link email creation for #{params[:email]}")
    Authentication::MagicLink::EmailSender.call(email: params[:email], redirect_path: params[:redirect_path])
    flash[:notice] = "Email sent to #{params[:email]}"
    redirect_to new_magic_link_email_path
  end

  def authenticate
    Rails.logger.info("Authenticating user from magic link email #{params.inspect}")
    redirect_to root_path
  end
end
