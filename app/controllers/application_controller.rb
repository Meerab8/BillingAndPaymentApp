# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,
                if: :devise_controller?
  # before_action :authenticate_user!

  # include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || root_path)
  end

  def record_not_found
    flash[:alert] = 'Record Not Found'
    redirect_to(request.referer || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :user_type, :avatar) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :avatar)
    end
  end
end
