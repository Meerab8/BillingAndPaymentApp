# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdditionalFeature, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:plan) }
    it { is_expected.to belong_to(:feature) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:increase_units) }
    it { is_expected.to validate_numericality_of(:increase_units).is_greater_than(-1) }
  end
end
