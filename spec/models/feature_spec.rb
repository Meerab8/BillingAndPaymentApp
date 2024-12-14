# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feature, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:additional_features).dependent(:destroy) }
    it { is_expected.to have_many(:plans).through(:additional_features) }
  end

  describe 'validations' do
    context 'when name validations passed' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_least(6).is_at_most(20) }
      it { is_expected.to allow_value('Nameexample').for(:name) }
      it { is_expected.not_to allow_value('Inv4lid_').for(:name) }
    end

    context 'when code validation passed' do
      it { is_expected.to validate_presence_of(:code) }
    end

    context 'when max_unit_limit validations passed' do
      it { is_expected.to validate_presence_of(:max_unit_limit) }
      it { is_expected.to validate_numericality_of(:max_unit_limit).is_greater_than(-1) }
    end

    context 'when unit price validations passed' do
      it { is_expected.to validate_presence_of(:unit_price) }
      it { is_expected.to validate_numericality_of(:unit_price).is_greater_than(-1) }
    end
  end
end
