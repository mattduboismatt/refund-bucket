class MagicLinkEmailsController < ApplicationController
  allow_unauthenticated!

  def new
    @redirect_path = params[:redirect_path]
  end

  def create
    Rails.logger.info("Processing magic link email creation for #{params[:email]}")
    # TODO: send email to params[:email] with params[:redirect_path]
    redirect_to dealers_path
  end
end
