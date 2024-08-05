# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  forename   :string
#  phone      :string
#  species    :string
#  surname    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
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
