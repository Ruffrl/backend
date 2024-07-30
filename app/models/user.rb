# frozen_string_literal: true

# Devise based User model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]

  has_one :profile
  delegate :forename, :surname, :avatar, to: :profile

  accepts_nested_attributes_for :profile

  def self.from_google(user)
    create_with(uid: user[:uid], provider: 'google',
                password: Devise.friendly_token[0, 20]).find_or_create_by!(email: u[:email])
  end
end
