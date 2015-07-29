class AddStatusToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :status, :string
    Plan.update_all(status: :PLANNING)
    change_column_null :plans, :status, false    
  end
end
