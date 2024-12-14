# frozen_string_literal: true

class TransactionRecordTable < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_records do |t|
      t.integer 'trans_fee', default: 0
      t.references :subscription, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
