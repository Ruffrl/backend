# frozen_string_literal: true

module Utils
  # Encodes and decodes JWT
  class JwtHelper
    SECRET = 'rufferalsecret'

    def self.generate_secret(payload)
      require 'debug'; binding.b
      JWT.encode(payload, SECRET)
    end

    def self.decode_secret(jwt_token)
      JWT.decode(jwt_token, SECRET)
    end
  end
end
