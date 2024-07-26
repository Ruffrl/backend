# frozen_string_literal: true

# Handles Devise registrations for sign-ins and sign-ups
class Users::RegistrationsController < Devise::RegistrationsController
  # For API development; will prevent rendering view
  respond_to :json

  private

  # Test a POST request
  # https://localhost:3000/signup
  # BODY (raw)
  # {
  #   "user": {
  #     "email": "test@test.com",
  #     "password": "123456",
  #     "forename": "Blarg",
  #     "surname": "McBlargson",
  #   }
  # }

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up successfully.' },
        data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: { message: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
