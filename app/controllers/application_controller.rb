# frozen_string_literal: true

#  Devise allows default parameters (email, password, password confirmation, remember me, etc.)
#  We also want name, avatar, and species (user type == OWNER, CARETAKER, OWNER_AND_CARETAKER)
#  This “sanitizes” (or permits) these new parameters
class ApplicationController < ActionController::API
  # For API development; will prevent rendering view
  respond_to :json

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[forename surname avatar species])

  #   devise_parameter_sanitizer.permit(:account_update, keys: %i[forename surname avatar species])
  # end
end
