class AddGroupImage < ActiveRecord::Migration
  def change
    add_attachment :groups, :main_image
  end
end
