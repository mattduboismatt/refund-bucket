class ExpirationReminderMailer < ApplicationMailer
  def remind
    @cadence = params[:cadence]
    @credit = params[:credit]
    @token = params[:token]
    @redirect_path = params[:redirect_path]

    mail(
      to: @credit.user.email,
      subject: "RefundBucket - credit expiring in #{@cadence} days"
    )
  end
end
