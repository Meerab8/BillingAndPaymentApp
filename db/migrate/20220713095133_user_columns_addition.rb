# frozen_string_literal: true

class UserColumnsAddition < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :user_type, :integer
  end
end
