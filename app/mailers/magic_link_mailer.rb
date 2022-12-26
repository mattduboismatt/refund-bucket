class MagicLinkMailer < ApplicationMailer
  def magic_link
    @user = params[:user]
    @token = params[:token]
    @redirect_path = params[:redirect_path]

    mail(
      to: @user.email,
      subject: "TODO: click this now!"
    )
  end
end
