# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    user_type { 0 }
    trait :admin do
      user_type { 1 }
    end
    factory :admin, traits: [:admin]
  end
end
