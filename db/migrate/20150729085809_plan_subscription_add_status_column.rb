class PlanSubscriptionAddStatusColumn < ActiveRecord::Migration
  def change
    add_column :plan_subscriptions, :status, :string
  end
end
