# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name          { Faker::Cannabis.buzzword }
    description   { Faker::Food.description }
  end
end
