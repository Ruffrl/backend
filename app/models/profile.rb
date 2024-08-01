# frozen_string_literal: true

# User Profile data
class Profile < ApplicationRecord
  belongs_to :account

  validates :forename, presence: true
  validates :surname, presence: true
  validates :species,
            inclusion: { in: Constants.profile.species.values,
                         message: "%<value>s is not type #{Constants.profile.species.values}" }
  # validates :avatar
  # validates :phone
end
