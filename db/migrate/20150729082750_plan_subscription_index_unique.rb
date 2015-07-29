class PlanSubscriptionIndexUnique < ActiveRecord::Migration
  def change
    add_index :plan_subscriptions, [:plan_id, :user_id], :unique => true
  end
end
