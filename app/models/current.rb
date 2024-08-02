# frozen_string_literal: true

# Access to the global, per-request attributes
class Current < ActiveSupport::CurrentAttributes
  attribute :session
  attribute :user_agent, :ip_address

  delegate :user, to: :session, allow_nil: true
end
