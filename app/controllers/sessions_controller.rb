# frozen_string_literal: true

# Manage user sessions (token behavior)
class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  before_action :set_session, only: %i[show destroy]

  def index
    render json: Current.user.sessions.order(created_at: :desc)
  end

  def show
    if logged_in?
      # render json: @session
      render json: current_user
    else
      render json: { error: 'No user logged in.' }
    end
  end

  # /login
  def create
    if user = User.authenticate_by(user_params)
      # @session = user.sessions.create!
      # response.set_header 'X-Session-Token', @session.signed_id

      payload = { user_id: user.id }
      token = issue_token(payload)
      # response.headers['Authorization'] = "Bearer #{token}"
      response.set_header 'Authorization', "Bearer #{token}"

      # render json: { session: @session, jwt: token }, status: :created'
      # render json: { session: @session, user: UserSerializer.new(user), jwt: token }, status: :created
      render json: UserSerializer.new(user), status: :created
    else
      render json: { error: 'Incorrect email or password.' }, status: :unauthorized
    end
  end

  def destroy
    @session.destroy
  end

  private

  def set_session
    @session = Current.user.sessions.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
