# frozen_string_literal: true

class Feature < ApplicationRecord
  has_many :additional_features, dependent: :destroy
  has_many :plans, through: :additional_features

  validates :name, presence: true, length: { in: 6..20 },
                   format: { with: /\A[a-zA-Z]+\z/, message: 'Enter letters only for feature name' }
  validates :code, presence: true
  validates :max_unit_limit, presence: true, numericality: { greater_than: -1 }
  validates :unit_price, presence: true, numericality: { greater_than: -1 }
end
