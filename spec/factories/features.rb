# frozen_string_literal: true

FactoryBot.define do
  factory :feature do
    name { Faker::Name.initials(number: 7) }
    code { 'hddh78' }
    unit_price { Faker::Number.number(digits: 2) }
    max_unit_limit { 50 }
  end
end
