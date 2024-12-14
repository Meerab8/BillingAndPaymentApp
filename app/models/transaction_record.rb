# frozen_string_literal: true

class TransactionRecord < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  validates :trans_fee, numericality: { greater_than: -1 }
end
