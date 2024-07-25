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
User.create!(email: 'rock@gmail.com', password: '12qwQW!@', forename: 'Sam', surname: 'Thomas', species: Constants.user.species.OWNER)
User.create!(email: 'pop@hotmail.com', password: '12qwQW!@', forename: 'Sarah', surname: 'Jones', species: Constants.user.species.CARETAKER)
User.create!(email: 'country@msn.com', password: '12qwQW!@', forename: 'Joe', surname: 'Smith', species: Constants.user.species.OWNER_AND_CARETAKER)
User.create!(email: 'folk@aol.com', password: '12qwQW!@', forename: 'Jen', surname: 'Adams', species:Constants.user.species.OWNER)
puts "User count: #{User.all.count}"
# ***************
# 