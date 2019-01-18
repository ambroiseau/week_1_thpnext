# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryBot.define do
  factory :user do
    email               { Faker::Internet.email }
    encrypted_password  { 'coucou' }

    trait :without_password do
      encrypted_password { nil }
    end

    trait :short_password do
      encrypted_password { 'cou' }
    end

    trait :without_email do
      encrypted_email { nil }
    end

    factory :user_without_password, traits: %i[without_password]
    factory :user_with_short_password, traits: %i[short_password]
    factory :user_without_email, traits: %i[without_email]
  end
end
