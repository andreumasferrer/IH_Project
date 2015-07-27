class AddPlanIdToPlanDates < ActiveRecord::Migration
  def change
    add_column :plan_dates, :plan_id, :integer
  end
end
