class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string  :name, null: false
      t.string  :short_desc
      t.text    :long_desc
      t.string  :image_url
      t.boolean :open_dates, null: false, default: false
      t.boolean :open_locations, null: false, default: false
      t.timestamps null: false
    end
  end
end
