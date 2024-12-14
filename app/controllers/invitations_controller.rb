# frozen_string_literal: true

class InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authorize_admin!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:accept_invitation) << %i[password_confirmation invitation_token]
  end
end
