# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.3', '>= 7.1.3.4'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem 'rack-cors'

# A fast JSON:API serializer for Ruby Objects [https://github.com/jsonapi-serializer/jsonapi-serializer]
gem 'jsonapi-serializer'

# Generate a pre-built authentication system into a rails application that follows both security and rails best practices
# [https://github.com/lazaronixon/authentication-zero]
gem 'authentication-zero'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1.7'

# A ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard [https://github.com/jwt/ruby-jwt]
gem 'jwt', '~> 2.8'

# Use Pwned to check if a password has been found in any of the huge data breaches [https://github.com/philnash/pwned]
gem 'pwned'

# Use Redis adapter to run additional authentication features
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
gem 'kredis'

# # OmniAuth is a flexible authentication system utilizing Rack middleware [https://github.com/omniauth/omniauth]
# gem 'omniauth'

# # Strategy to authenticate with Google via OAuth2 in OmniAuth [https://github.com/zquestz/omniauth-google-oauth2]
# gem 'omniauth-google-oauth2'

# # This gem provides a mitigation against CVE-2015-9284 (Cross-Site Request Forgery on the request phase when using
# # OmniAuth gem with a Ruby on Rails application) by implementing a CSRF token verifier that directly uses
# # ActionController::RequestForgeryProtection code from Rails [https://github.com/cookpad/omniauth-rails_csrf_protection]
# gem 'omniauth-rails_csrf_protection'
#
## Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :production do
  # Use Rack::Ratelimit to rate limit requests [https://github.com/jeremy/rack-ratelimit]
  gem 'rack-ratelimit'
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]

  # RuboCop is a Ruby static code analyzer (a.k.a. linter) and code formatter [https://github.com/rubocop/rubocop]
  gem 'rubocop'

  # Add a comment summarizing the current schema to the top or bottom of each of
  # models, fixtures, tests, examplars, blueprints, fabricators, factories, and routes [https://github.com/ctran/annotate_models]
  gem 'annotate'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
