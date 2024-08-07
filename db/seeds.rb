# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# ***************
# SEEDING USERS
puts 'destroying Profiles'
Profile.destroy_all
puts 'destroying Users'
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('profiles')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
puts "count of Users: #{User.all.count}"

puts 'creating User records'
User.create!(
  email: 'rock@gmail.com',
  password: 'password',
  verified: true,
  profile_attributes: {
    forename: 'Sam',
    surname: 'Thomas',
    species: Constants.profile.species.OWNER
  }
)
User.create!(
  email: 'pop@hotmail.com',
  password: 'password',
  profile_attributes: {
    forename: 'Sarah',
    surname: 'Jones',
    phone: '555-555-5555',
    species: Constants.profile.species.OWNER
  }
)
User.create!(
  email: 'country@msn.com',
  password: 'password',
  verified: true,
  profile_attributes: {
    forename: 'Joe',
    surname: 'Smith',
    avatar: 'https://s3.sdkjfhksjdfhs.com',
    species: Constants.profile.species.CARETAKER
  }
)
User.create!(
  email: 'folk@aol.com',
  password: 'password',
  profile_attributes: {
    forename: 'Jen',
    surname: 'Adams',
    species: Constants.profile.species.OWNER_AND_CARETAKER
  }
)
puts "post creation - count of Users: #{User.all.count}"
# ***************
