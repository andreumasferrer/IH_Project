class AddConfirmationDate < ActiveRecord::Migration
  def change
    add_column :plans, :plan_date_id, :integer
  end
end
