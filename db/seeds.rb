# frozen_string_literal: true

Item.destroy_all
Category.destroy_all

1.upto(10) do |i|
  Item.create!(name: Faker::Artist.name, original_price: Faker::Number.decimal(2))
  p "ITEM #{i} : créé"
end

1.upto(5) do |_i|
  Category.create!(name: Faker::Cannabis.buzzword, description: Faker::Food.description)
end

# 1.upto(5) do |_i|
#   Category.create!(username: Faker::BojackHorseman.name, email: Faker::Internet.)
# end
