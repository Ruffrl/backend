# frozen_string_literal: true

# As a Rails API-only app, sessions are disabled by default in
# Rails 7+ and Devise relies on sessions to function. A session
# is an ActionDispatch::Session object, which is not writable
# on Rails API-only apps. Because the ActionDispatch::Session
# is disabled. If we try to use devise in this configuration
# we will get the error:
#   ActionDispatch::Request::Session::DisabledSessionError
#   (Your application has sessions disabled. To write to the
#   session you must first configure a session store):
module RackSessionsFix
  extend ActiveSupport::Concern

  # This is a workaround (create a fake session hash) to the problem above:
  class FakeRackSession < Hash
    def enabled?
      false
    end

    def destroy; end
  end
  included do
    before_action :set_fake_session

    private

    def set_fake_session
      request.env['rack.session'] ||= FakeRackSession.new
    end
  end
end
