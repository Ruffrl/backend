# frozen_string_literal: true

# Permits User data
class UserSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  attributes :id, :email, :verified, :forename, :surname, :avatar, :species
end
