# frozen_string_literal: true

class Plan < ApplicationRecord
  validates :name, presence: true, length: { in: 6..20 },
                   format: { with: /\A[a-zA-Z]+\z/, message: 'Enter Valid Plan name' }
  validates :monthly_fee, presence: true,  numericality: { greater_than: -1 }

  has_many :additional_features, dependent: :destroy
  has_many :features, through: :additional_features, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions, dependent: :destroy
end
