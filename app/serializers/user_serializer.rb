class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email
  # attributes :id, :email, :forename, :surname, :avatar, :species
end
