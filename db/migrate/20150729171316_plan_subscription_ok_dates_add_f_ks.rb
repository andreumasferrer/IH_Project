class PlanSubscriptionOkDatesAddFKs < ActiveRecord::Migration
  def change
    add_column :plan_subscription_ok_dates, :plan_subscription_id, :integer
    add_column :plan_subscription_ok_dates, :plan_date_id, :integer
  end
end
