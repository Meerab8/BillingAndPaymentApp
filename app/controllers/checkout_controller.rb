# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :set_plan, only: %i[create]

  def create
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: @plan.name,
                                                    amount: @plan.monthly_fee,
                                                    currency: 'usd',
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: subscribe_plan_plan_url(@plan),
                                                  cancel_url: root_url
                                                })
    respond_to do |format|
      format.js
    end
  end

  private

  def set_plan
    @plan = Plan.find_by(id: params[:plan_id])
  end
end
