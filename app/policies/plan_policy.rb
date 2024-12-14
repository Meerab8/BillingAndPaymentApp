# frozen_string_literal: true

class PlanPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def edit?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

  def show?
    @user.admin?
  end

  def subscribe_plan?
    @user.buyer?
  end

  def unsubscribe_plan?
    @user.buyer?
  end
end
