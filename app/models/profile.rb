# frozen_string_literal: true

# # frozen_string_literal: true

# # Add a user's initial Profile fields
# class CreateProfiles < ActiveRecord::Migration[7.1]
#   def change
#     create_table :profiles do |t|
#       t.string :forename
#       t.string :surname
#       t.string :species
#       t.string :avatar
#       t.string :phone
#       t.references :user, null: false, foreign_key: true

#       t.timestamps
#     end
#   end
# end

# User Profile data
class Profile < ApplicationRecord
  belongs_to :user

  validates :forename, presence: true
  validates :surname, presence: true
  validates :species,
            inclusion: { in: Constants.profile.species.values,
                         message: "%<value>s is not type #{Constants.profile.species.values}" }
  # validates :avatar
  # validates :phone
end
