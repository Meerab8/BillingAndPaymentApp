# frozen_string_literal: true

class PlansController < ApplicationController
  before_action :set_plan, except: %i[index new create]
  # before_action :plan_authorization, except: %i[index]

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.feature_ids = params.dig(:plan, :feature_id)
    if @plan.save
      flash[:success] = 'Plan created!'
      redirect_to plans_path
    else
      @errors = @plan.errors.full_messages
      render :new
    end
  end

  def update
    if @plan.update(plan_params)
      flash[:success] = 'Plan Updated!'
      redirect_to plan_path(@plan)
    else
      @errors = @plan.errors.full_messages
      render :edit
    end
  end

  def destroy
    return unless @plan.destroy

    flash[:success] = 'Plan was successfully destroyed.'
    redirect_to plans_url
  end

  def subscribe_plan
    Subscription.create(user_id: current_user.id, plan_id: @plan.id)
    BillPaymentJob.set(wait: 1.minute).perform_later
    redirect_to plans_path
  end

  def unsubscribe_plan
    return unless current_user.subscriptions.find_by!(plan_id: @plan.id)&.destroy

    flash[:success] = 'Plan was successfully Unsubscribed.'
    redirect_to plans_url
  end

  private

  def plan_authorization
    authorize Plan
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :monthly_fee, :feature_ids)
  end
end
