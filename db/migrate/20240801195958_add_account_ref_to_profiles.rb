# frozen_string_literal: true

# Connect Account and Profile
class AddAccountRefToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_reference :profiles, :account, null: false, foreign_key: true
  end
end
