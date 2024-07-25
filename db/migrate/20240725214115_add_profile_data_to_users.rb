# frozen_string_literal: true

# Add permitted (profile) fields to devise User model
class AddProfileDataToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :forename, :string
    add_column :users, :surname, :string
    add_column :users, :avatar, :string
    add_column :users, :species, :string
  end
end
