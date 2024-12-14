# frozen_string_literal: true

module SubscriptionCheck
  def subscription?(plan)
    Subscription.find_by(user_id: current_user.id, plan_id: plan.id)
  end
end
