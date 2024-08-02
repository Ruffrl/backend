# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  verified        :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  has_one :profile
  delegate :forename, :surname, :avatar, :species, :phone, to: :profile
  accepts_nested_attributes_for :profile, allow_destroy: true

  has_many :sessions, dependent: :destroy
  has_many :events, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # BLARG - manage additional password requirements in the future (match Google or Apple password requirements)
  validates :password, allow_nil: true, length: { minimum: 8 }

  normalizes :email, with: -> { _1.strip.downcase }

  generates_token_for :email_verification, expires_in: 2.days do
    email
  end
  generates_token_for :password_reset, expires_in: 20.minutes do
    password_salt.last(10)
  end

  before_validation if: :email_changed?, on: :update do
    self.verified = false
  end

  after_update if: :password_digest_previously_changed? do
    sessions.where.not(id: Current.session).delete_all
  end

  after_update if: :email_previously_changed? do
    events.create! action: 'email_verification_requested'
  end

  after_update if: :password_digest_previously_changed? do
    events.create! action: 'password_changed'
  end

  after_update if: %i[verified_previously_changed? verified?] do
    events.create! action: 'email_verified'
  end
end
