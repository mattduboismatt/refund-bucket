class ApplicationController < ActionController::Base
  before_action :require_login

  def require_login
    return if logged_in?

    redirect_to new_magic_link_email_path(
      redirect_path: request.original_fullpath
    )
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  def logged_in?
    current_user.present?
  end

  helper_method :logged_in?

  def self.allow_unauthenticated!
    skip_before_action :require_login
  end
end
