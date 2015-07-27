class AddPlanIdToPlanLocations < ActiveRecord::Migration
  def change
    add_column :plan_locations, :plan_id, :integer
  end
end
