# frozen_string_literal: true

class FeaturePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    @user.admin?
  end

  def new?
    @user.admin?
  end

  def edit?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

  def index?
    @user.admin?
  end
end
