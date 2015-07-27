class CreatePlanDates < ActiveRecord::Migration
  def change
    create_table :plan_dates do |t|
      t.datetime  :start_date, null: false
      t.datetime  :end_date
      t.boolean   :all_day, null: false, default: false
      t.timestamps null: false
    end
  end
end
