class AddImageToPlan < ActiveRecord::Migration
  def change
    add_attachment :plans, :main_image
    remove_column :plans, :image_url
  end
end
