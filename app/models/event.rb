# frozen_string_literal: true

# Manage storing and retrieving account tracking data
class Event < ApplicationRecord
  belongs_to :user

  before_create do
    self.user_agent = Current.user_agent
    self.ip_address = Current.ip_address
  end
end
