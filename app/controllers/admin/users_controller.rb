# frozen_string_literal: true

module Admin
  # For Admin testing/debugging Users/accounts
  class UsersController < ApplicationController
    before_action :authorize_user

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
      users = User.all
      render json: UserSerializer.new(users)
    end

    def show
      render json: UserSerializer.new(User.find(params[:id]))
    end

    def destroy
      User.find(params[:id]).destroy
      head :no_content
    end

    private

    def render_not_found_response
      render json: { error: 'User Not Found' }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
