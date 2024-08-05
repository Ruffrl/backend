# frozen_string_literal: true

# Manages application level (most controllers will inherit from here)
class ApplicationController < ActionController::API
  # include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :set_current_request_details
  before_action :authorize_user

  JWT_EXPIRATION = 4 * 3600

  # private

  # Our hidden secret key (lives in rails credentials for now [development will need an update]
  def jwt_key
    Rails.application.credentials.jwt_key
  end

  def issue_token(payload:, expiration: JWT_EXPIRATION)
    # Expiration in seconds [default set to 24 hours]
    payload = { data: payload, exp: Time.current.to_i + expiration }
    JWT.encode(payload, jwt_key, 'HS256')
  end

  def decoded_token
    return unless auth_header_token

    begin
      JWT.decode(auth_header_token, jwt_key, true, { algorithm: 'HS256' })
    rescue JWT::DecodeError => e
      'Invalid authorization'
    rescue JWT::ExpiredSignature
      'Login expired'
    end
  end

  def auth_header_token
    request.headers['Authorization'].split(' ')[1]
  end

  def current_user
    user ||= session_user
  end

  def session_user
    decoded_hash = decoded_token
    # BLARG - I may just want to always show "Please log in."
    # but for now this gives me a better debugging idea of why JWT decode failed
    # return if decoded_hash.blank? || decoded_hash.instance_of?(String)
    return if decoded_hash.blank?
    return render json: { message: decoded_hash }, status: :unauthorized if decoded_hash.instance_of?(String)

    user_id = decoded_hash[0]['data']['user_id']
    User.find_by id: user_id
  end

  def logged_in?
    !!current_user
  end

  # def token
  #   request.headers['Authorization']
  # end

  # def user_id
  #   decoded_token.first['user_id']
  # end

  # def current_user
  #   user ||= User.find_by(id: user_id)
  # end

  def authorize_user
    # if session_record = authenticate_with_http_token { |http_token, _| Session.find_signed(http_token) }
    #   Current.session = session_record
    # else
    #   request_http_token_authentication
    # end

    # if token == decoded_token
    #   Current.session = token
    # else
    #   issue_token(current_user)
    # end

    if logged_in?
      Current.session ||= auth_header_token
    else
      render json: { message: 'Please log in.' }, status: :unauthorized
    end
  end

  def set_current_request_details
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
  end

  def require_lock(wait: 1.hour, attempts: 10)
    counter = Kredis.counter("require_lock:#{request.remote_ip}:#{controller_path}:#{action_name}", expires_in: wait)
    counter.increment

    return unless counter.value > attempts

    render json: { error: "You've exceeded the maximum number of attempts" }, status: :too_many_requests
  end
end
