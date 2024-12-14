# frozen_string_literal: true

class AddingColumnsToAdditionalFeature < ActiveRecord::Migration[5.2]
  def change
    add_reference :additional_features, :plan, index: true
    add_reference :additional_features, :feature, index: true
  end
end
