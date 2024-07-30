# frozen_string_literal: true

# Permits User data
class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email
  # attributes :id, :email, :forename, :surname, :avatar, :species
end
