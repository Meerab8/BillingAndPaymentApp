# frozen_string_literal: true

class Plans < ActiveRecord::Migration[5.2]
  def change
    create_table 'plans', force: :cascade do |t|
      t.string 'name', default: '', null: false
      t.integer 'monthly_fee', default: '', null: false
    end
  end
end
