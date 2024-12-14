# frozen_string_literal: true

class BillPaymentJob < ApplicationJob
  queue_as :default

  def self.perform
    subscriptions = Subscription.all
    subscriptions.each do |subscription|
      send_mail(subscription)
    end
  end

  private

  def send_mail(subscription)
    subscription.billing_date = Time.zone.today.end_of_month if subscription.billing_date.day > 28
    ContactMailer.submission(subscription.user_id).deliver_now if subscription.billing_date.day == Time.zone.today.day
  end
end
