# frozen_string_literal: true

class AdditionalFeature < ApplicationRecord
  belongs_to :plan
  belongs_to :feature
  validates :increase_units, presence: true, numericality: { greater_than: -1 }
end
