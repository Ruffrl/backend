# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.
# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.development?
      origins 'localhost:3000', 'localhost:5000'
    else
      origins 'https://rufferal-123456789.herokuapp.com'
    end

    resource '*',
             headers: :any,
             expose: %i[Authorization],
             methods: %i[get post put patch delete options head]
  end
end
