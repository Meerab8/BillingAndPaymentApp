# frozen_string_literal: true

class ChangeUserTable < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string, null: false, default: ''
    change_column :users, :user_type, :integer, default: 0
  end
end
