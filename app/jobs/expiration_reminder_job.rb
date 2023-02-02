class ExpirationReminderJob < ApplicationJob
  include Rails.application.routes.url_helpers

  def perform(cadence, credit_id)
    credit = Credit.where(id: credit_id).includes(:user).first
    return unless credit

    # generate new token so user can authenticate and redirect
    token = Authentication::MagicLink::TokenGenerator.call(credit.user)
    ExpirationReminderMailer.with(
      credit: credit,
      cadence: cadence,
      token: token,
      redirect_path: credits_url # redirect user to credits page
    ).remind.deliver_later
  end
end
