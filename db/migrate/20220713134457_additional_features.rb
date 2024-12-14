# frozen_string_literal: true

class AdditionalFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :additional_features do |t|
      t.integer 'increase_units', default: 0
    end
  end
end
