# frozen_string_literal: true

module Authentications
  # Manages account/user tracking level behavior
  class EventsController < ApplicationController
    def index
      render json: Current.user.events.order(created_at: :desc)
    end
  end
end
