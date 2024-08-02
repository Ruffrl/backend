# frozen_string_literal: true

# Used by Rodauth for rendering views, CSRF protection, running any
# registered action callbacks and rescue handlers, instrumentation etc.
class RodauthController < ApplicationController
  # after_action :set_jwt_token, only: :login, if: -> { request.post? }

  # Controller callbacks and rescue handlers will run around Rodauth endpoints.
  # before_action :verify_captcha, only: :login, if: -> { request.post? }
  # rescue_from("SomeError") { |exception| ... }

  # Layout can be changed for all Rodauth pages or only certain pages.
  # layout "authentication"
  # layout -> do
  #   case rodauth.current_route
  #   when :login, :create_account, :verify_account, :verify_account_resend,
  #        :reset_password, :reset_password_request
  #     "authentication"
  #   else
  #     "application"
  #   end
  # end

  private

  def set_jwt_token
    # require 'debug'; binding.b
    # return unless rodauth(:account).use_jwt? && rodauth(:account).valid_jwt?
    return unless rodauth.use_jwt? && rodauth.valid_jwt?

    require 'debug'
    binding.b

    # return unless rodauth(:account).valid_jwt?

    # response.headers['Authorization'] = rodauth(:account).session_jwt
    response.headers['Authorization'] = rodauth.session_jwt
  end
end
