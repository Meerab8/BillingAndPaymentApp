# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:additional_features).dependent(:destroy) }
    it { is_expected.to have_many(:features).through(:additional_features).dependent(:destroy) }
    it { is_expected.to have_many(:subscriptions).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:subscriptions).dependent(:destroy) }
  end

  describe 'validations' do
    context 'when validations of name passed' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_least(6).is_at_most(20) }
      it { is_expected.to allow_value('Nameexample').for(:name) }
      it { is_expected.not_to allow_value('Inv4lid_').for(:name) }
    end

    context 'when validations of monthly fee passed' do
      it { is_expected.to validate_presence_of(:monthly_fee) }
      it { is_expected.to validate_numericality_of(:monthly_fee).is_greater_than(-1) }
    end
  end
end
