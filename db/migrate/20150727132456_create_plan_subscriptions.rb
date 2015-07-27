class CreatePlanSubscriptions< ActiveRecord::Migration
  def change
    create_table :plan_subscriptions do |t|
      t.integer  :plan_id
      t.integer  :user_id
      t.timestamps null: false
    end
  end
end
