# frozen_string_literal: true

# Remove devise-jwt and JTI column (https://github.com/waiting-for-dev/devise-jwt)
class RemoveJtiFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :jti, :string
  end
end
