# frozen_string_literal: true

class Subscription < ApplicationRecord
  after_create :create_payment
  has_one :transaction_record, dependent: :destroy
  belongs_to :plan
  belongs_to :user
  validates :user_id, uniqueness: { scope: :plan_id, case_sensitive: false }

  def create_payment
    plan = Plan.find_by(id: plan_id)
    TransactionRecord.create(subscription_id: id, user_id: user.id, trans_fee: plan.monthly_fee)
  end
end
