# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# SEEDING USERS
puts 'destroying all User records'
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
puts "User count: #{User.all.count}"
puts 'creating User records'
User.create!(email: 'rock@gmail.com', password: 'password', forename: 'Sam', surname: 'Thomas', species: Constants.user.species.OWNER, jti: 'token1')
User.create!(email: 'pop@hotmail.com', password: 'password', forename: 'Sarah', surname: 'Jones', species: Constants.user.species.CARETAKER, jti: 'token2')
User.create!(email: 'country@msn.com', password: 'password', forename: 'Joe', surname: 'Smith', species: Constants.user.species.OWNER_AND_CARETAKER, jti: 'token3')
User.create!(email: 'folk@aol.com', password: 'password', forename: 'Jen', surname: 'Adams', species:Constants.user.species.OWNER, jti: 'token4')
puts "User count: #{User.all.count}"
# ***************
# 