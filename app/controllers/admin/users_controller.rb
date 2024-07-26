# frozen_string_literal: true

module Admin
  # For Admin testing User purposes
  class UsersController < ApplicationController
    before_action :authenticate_user!, except: %I[index]

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
      render json: User.all
    end

    def show
      render json: User.find(params[:id])
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
