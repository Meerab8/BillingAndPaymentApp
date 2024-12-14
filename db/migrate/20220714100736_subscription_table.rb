# frozen_string_literal: true

class SubscriptionTable < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :plan, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
