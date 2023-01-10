class MagicLinkEmailsController < ApplicationController
  allow_unauthenticated!

  def new
    render :closed unless Rails.application.config_for(:feature_flags).allow_signups
    @redirect_path = params[:redirect_path]
  end

  def create
    redirect_to root_path unless Rails.application.config_for(:feature_flags).allow_signups
    Rails.logger.info("Processing magic link email creation for #{params[:email]}")
    Authentication::MagicLink::EmailSender.call(email: params[:email], redirect_path: params[:redirect_path])
    flash[:notice] = "Email sent to #{params[:email]}"
    redirect_to new_magic_link_email_path
  end

  def authenticate
    Rails.logger.info("Authenticating user from magic link email #{params.inspect}")
    user = User.where(auth_token: params[:token])
      .where("auth_token_expires_at > ?", Time.zone.now)
      .first

    if user.present?
      reset_session
      session[:user_id] = user.id
      flash[:notice] = "Hi #{user.email}"
      redirect_to params[:redirect_path]
    else
      flash[:error] = "Hmm... that didn't work. Please try again?"
      redirect_to new_magic_link_email_path(redirect_path: params[:redirect_path])
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Cya later!"
    redirect_to new_magic_link_email_path
  end
end
