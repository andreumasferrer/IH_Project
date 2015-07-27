class CreatePlanLocations < ActiveRecord::Migration
  def change
    create_table :plan_locations do |t|
      t.string  :name, null: false
      t.text :description
      t.text :address
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end
