# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionRecord, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:subscription) }
  end

  describe 'validations' do
    it { is_expected.to validate_numericality_of(:trans_fee).is_greater_than(-1) }
  end
end
