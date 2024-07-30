# frozen_string_literal: true

module Users
  # Creates endpoints for Google sign in/sign up
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # You should configure your model like this:
    # devise :omniauthable, omniauth_providers: [:twitter]

    # You should also create an action method in this controller like this:
    # def twitter
    # end

    # More info at:
    # https://github.com/heartcombo/devise#omniauth

    # GET|POST /resource/auth/twitter
    # def passthru
    #   super
    # end

    # GET|POST /users/auth/twitter/callback
    # def failure
    #   super
    # end

    # protected

    # The path used when OmniAuth fails
    # def after_omniauth_failure_path_for(scope)
    #   super(scope)
    # end
    #
    # respond_to :json
    puts '******* INSIDE OmniauthCallbacksController'
    # # See https://github.com/omniauth/omniauth/wiki/FAQ#rails-session-is-clobbered-after-callback-on-developer-strategy
    # skip_before_action :verify_authenticity_token, only: :google_oauth2

    def google_oauth2
      puts '*************** BLARG ***************'
      user = User.from_omniauth(auth)
      puts "******* user: #{user}"
      puts '*************** BLOOF ***************'

      if user.present?
        sign_out_all_scopes
        render json: {
                 status: 'SUCCESS',
                 message: "user was successfully logged in through #{auth.provider}",
                 headers: login_token
               },
               status: :created
        sign_in_and_redirect user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
        render json: {
                 status: 'FAILURE',
                 message: "There was a problem signing you in through #{auth.provider}",
                 data: @user.errors
               },
               status: :unprocessable_entity
        redirect_to_ new_user_session_path
      end

      # puts '*************** BLARG ***************'
      # puts "******* from_google_params: #{from_google_params}"
      # @user = User.from_google(from_google_params)
      # puts "******* @user: #{@user}"
      # puts '*************** BLOOF ***************'

      # if user.present?
      #   sign_out_all_scopes
      #   flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      #   sign_in_and_redirect user, event: :authentication
      # else
      #   flash[:alert] =
      #     t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      #   redirect_to new_user_session_path
      # end

      # if @user.persisted?
      #   # sign_out_all_scopes
      #   sign_in_and_redirect @user, event: :authentication
      #   render json: {
      #            status: 'SUCCESS',
      #            message: "user was successfully logged in through #{params[:provider]}",
      #            headers: login_token
      #          },
      #          status: :created
      # else
      #   session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      #   # session['devise.oauth_data'] = auth.except(:extra) # Removing extra as it can overflow some session stores
      #   # redirect_to 'http://localhost:3000/failure/state'
      #   # redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")

      #   render json: {
      #            status: 'FAILURE',
      #            message: "There was a problem signing you in through #{params[:provider]}",
      #            data: @user.errors
      #          },
      #          status: :unprocessable_entity
      # end
    end

    def failure
      # redirect_to '/user/sign_in?error=Unknown'
      redirect_to '/api/login'
      # redirect_to 'http://localhost:3000'
    end

    def passthru
      super
    end

    private

    def auth
      @auth ||= request.env['omniauth.auth']
    end

    # def from_google_params
    #   @from_google_params ||= {
    #     uid: auth.uid,
    #     email: auth.info.email
    #   }
    # end
  end
end
