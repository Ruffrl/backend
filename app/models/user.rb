# frozen_string_literal: true

# Devise based User model
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  devise :omniauthable, omniauth_providers: %i[google_oauth2]

  has_one :profile

  accepts_nested_attributes_for :profile

  def self.from_google(user)
    create_with(uid: user[:uid], provider: 'google',
                password: Devise.friendly_token[0, 20]).find_or_create_by!(email: u[:email])
  end
end
