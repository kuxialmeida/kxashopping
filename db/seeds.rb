require 'faker'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
Category.create!(name: "Electronics")
Category.create!(name: "Home Appliances")

20.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price: rand(10..100),
    stock: rand(5..50),
    discount: rand(5..50),
    rating: rand(3.0..5.0).round(1),
    sales: rand(50..500),
    promotion: [true, false].sample,
    category_id: Category.pluck(:id).sample
  )
end

