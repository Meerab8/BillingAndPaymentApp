# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_one_attached(:avatar) }
    it { is_expected.to have_many(:subscriptions).dependent(:destroy) }
    it { is_expected.to have_many(:plans).through(:subscriptions).dependent(:destroy) }
    it { is_expected.to have_many(:transaction_records).dependent(:destroy) }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:user_type).with_values(%i[buyer admin]) }
  end
end
