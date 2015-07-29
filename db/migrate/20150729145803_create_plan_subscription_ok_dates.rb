class CreatePlanSubscriptionOkDates < ActiveRecord::Migration
  def change
    create_table :plan_subscription_ok_dates do |t|
      t.integer   :order, null: false
      t.timestamps null: false
    end
  end
end
