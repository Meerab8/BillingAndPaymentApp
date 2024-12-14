# frozen_string_literal: true

class AdditionalFeaturesController < ApplicationController
  before_action :set_additional_feature, only: %i[update]
  before_action :set_transaction, only: %i[update]
  before_action :set_feature, only: %i[update]

  def update
    overuse_charges = params.dig(:additional_feature, :increase_units).to_i * set_feature&.unit_price
    set_transaction&.update(trans_fee: (overuse_charges + set_transaction&.trans_fee))
    redirect_to root_url
  end

  private

  def set_additional_feature
    @additional_feature = AdditionalFeature.find_by(id: params[:id])
  end

  def set_subscription
    Subscription.find_by(plan_id: @additional_feature.plan_id, user_id: current_user.id).id
  end

  def set_transaction
    TransactionRecord.find_by(subscription_id: set_subscription)
  end

  def set_feature
    Feature.find_by(id: @additional_feature.feature_id)
  end
end
