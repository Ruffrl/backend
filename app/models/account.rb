# frozen_string_literal: true

# RodAuth generated Account model
class Account < ApplicationRecord
  include Rodauth::Rails.model

  enum :status, unverified: 1, verified: 2, closed: 3

  has_one :profile
  delegate :forename, :surname, :avatar, :species, to: :profile
end
