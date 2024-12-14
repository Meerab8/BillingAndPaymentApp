# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let(:subscription) { create(:subscription) }

  describe 'callbacks' do
    it { is_expected.to callback(:create_payment).after(:create) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:transaction_record).dependent(:destroy) }
    it { is_expected.to belong_to(:plan) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    # it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:plan_id).case_insensitive }
  end

  describe 'methods' do
    it 'create a transaction record' do
      described_class.skip_callback(:create, :after, :create_payment)
      expect do
        subscription.create_payment
      end.to change(TransactionRecord, :count).by(1)
    end
  end
end
