# frozen_string_literal: true

# Handles CRUD endpoints for Users
# BLARG - is this controller necessary?
class UsersController < ApplicationController
  before_action :authenticate_account

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    render json: AccountSerializer.new(Account.find(params[:id]))
  end

  def destroy
    Account.find(params[:id]).destroy
    head :no_content
  end

  private

  def render_not_found_response
    render json: { error: 'Account Not Found' }, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
