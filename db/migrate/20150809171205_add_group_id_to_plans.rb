class AddGroupIdToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :group_id, :integer
  end
end
