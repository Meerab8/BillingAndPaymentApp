# frozen_string_literal: true

class Features < ActiveRecord::Migration[5.2]
  def change
    create_table 'features', force: :cascade do |t|
      t.string 'name', default: '', null: false
      t.string 'code', default: '', null: false
      t.integer 'unit_price', default: 0, null: false
      t.integer 'max_unit_limit', default: 50, null: false
    end
  end
end
