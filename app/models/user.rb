# frozen_string_literal: true

# Devise based User model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_one :profile
  delegate :forename, :surname, :avatar, to: :profile

  accepts_nested_attributes_for :profile

  def self.from_omniauth(auth)
    puts "******* auth: #{auth}"
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  # def self.from_google(google_params)
  #   puts "******* google_params: #{google_params}"
  #   create_with(uid: google_params[:uid], provider: 'google',
  #               password: Devise.friendly_token[0, 20]).find_or_create_by!(email: google_params[:email])
  # end

  # def self.authenticate(email, password)
  #   user = User.find_for_authentication(email:)
  #   user.try(:valid_password?, password) ? user : nil
  # end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if session['devise.oauth_data'].present?
  #       provider = session['devise.oauth_data']['provider']
  #       if provider == 'google_oauth2' && (data = session['devise.oauth_data']) && user.email.blank?
  #         user.email = data['info']['email']
  #       end
  #     end
  #   end
  # end
end
