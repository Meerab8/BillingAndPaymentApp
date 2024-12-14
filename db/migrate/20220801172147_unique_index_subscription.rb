class UniqueIndexSubscription < ActiveRecord::Migration[5.2]
  def change
    add_index :subscriptions, %i[plan_id user_id], unique: true
  end
end
