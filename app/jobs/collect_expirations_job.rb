class CollectExpirationsJob < ApplicationJob
  REMINDER_CADENCES = [15, 60, 120]

  def perform
    groups = REMINDER_CADENCES.to_h do |cadence|
      [cadence, Credit.unredeemed.expires_in_days(cadence).pluck(:id)]
    end

    Rails.logger.info("Found credits expiring soon: #{groups.inspect}")

    groups.each do |cadence, credit_ids|
      credit_ids.each do |credit_id|
        Rails.logger.info("Scheduling #{cadence} day ExpirationReminderJob for credit #{credit_id}")
        ExpirationReminderJob.perform_later(cadence, credit_id)
      end
    end
  end
end
