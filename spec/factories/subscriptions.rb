# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    association  :plan
    association  :user
  end
end
