# frozen_string_literal: true

FactoryBot.define do
  factory :plan do
    name { Faker::Name.initials(number: 7) }
    monthly_fee { Faker::Number.number(digits: 5) }
  end
end
