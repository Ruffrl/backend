# frozen_string_literal: true

# Permits User data
class AccountSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  attributes :id, :email, :status, :forename, :surname, :avatar, :species
end
