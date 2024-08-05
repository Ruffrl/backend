# frozen_string_literal: true

# Manage user registations (create account)
class RegistrationsController < ApplicationController
  skip_before_action :authorize_user

  # /sign_up
  def create
    @user = User.new(user_params)

    if @user.save
      send_email_verification
      payload = { user_id: @user.id }
      token = issue_token(payload:)

      render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
    elsif @user.errors.messages
      render json: { error: @user.errors }, status: :unprocessable_entity
    else
      render json: { error: 'User could not be created. Please try again.' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
    # params.require(:user).permit(:email, :password, :forename, :surname, :avatar, :species)
  end

  def send_email_verification
    UserMailer.with(user: @user).email_verification.deliver_later
  end
end
