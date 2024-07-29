# frozen_string_literal: true

# Add a user's initial Profile fields
class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :forename
      t.string :surname
      t.string :species
      t.string :avatar
      t.string :phone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
