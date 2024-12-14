# frozen_string_literal: true

class ChangeTransactionRecord < ActiveRecord::Migration[5.2]
  def change
    change_column :transaction_records, :trans_fee, :integer, null: false, default: 0
  end
end
