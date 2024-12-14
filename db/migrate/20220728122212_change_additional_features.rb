# frozen_string_literal: true

class ChangeAdditionalFeatures < ActiveRecord::Migration[5.2]
  def change
    change_column :additional_features, :increase_units, :integer, null: false, default: 0
  end
end
