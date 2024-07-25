# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# User.create!(first_name: 'Sam', last_name: 'Thomas', email: 'rock@gmail.com')
# User.create!(first_name: 'Sarah', last_name: 'Jones', email: 'pop@hotmail.com')
# User.create!(first_name: 'Joe', last_name: 'Smith', email: 'country@msn.com')
# User.create!(first_name: 'Jen', last_name: 'Adams', email: 'folk@aol.com')
User.destroy_all
User.create!(email: 'rock@gmail.com', password: '12qwQW!@', forename: 'Sam', surname: 'Thomas')
User.create!(email: 'pop@hotmail.com', password: '12qwQW!@', forename: 'Sarah', surname: 'Jones')
User.create!(email: 'country@msn.com', password: '12qwQW!@', forename: 'Joe', surname: 'Smith')
User.create!(email: 'folk@aol.com', password: '12qwQW!@', forename: 'Jen', surname: 'Adams')