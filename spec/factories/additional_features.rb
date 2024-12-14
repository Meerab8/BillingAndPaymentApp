# frozen_string_literal: true

FactoryBot.define do
  factory :additional_features do
    increase_units { Faker::Number.number(digits: 2) }
    association :plan
    association :feature
  end
end
