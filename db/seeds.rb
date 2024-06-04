# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# destroy all records in the database if development environment
# and create 3 users and 10 cameras
if Rails.env.development?
  Camera.destroy_all
  User.destroy_all
end

# Create a 3 users for application
emails = %w[pedro@mail.com thuthi@mail.com sahba@mail.com]
3.times do
  User.create!(email: emails.pop,
               password: "password",
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name)
end
# Create 10 cameras for application
10.times do
  Camera.create!(name: Faker::Device.model_name,
                 optical_zoom: Faker::Number.between(from: 1, to: 100),
                 price_per_day: Faker::Number.decimal(l_digits: 2),
                 address: Faker::Address.full_address,
                 resolution: Faker::Number.decimal(l_digits: 2),
                 user_id: User.all.sample.id)
end
