# frozen_string_literal: true

module SubscribedPlan
  def subscribed_plans(subscription)
    Plan.find_by(id: subscription.plan_id)
  end
end
