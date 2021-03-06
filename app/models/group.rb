class Group < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :users
  has_many :plans, dependent: :destroy

  has_attached_file :main_image, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "missing_group.png"
  validates_attachment_content_type :main_image, :content_type => /\Aimage\/.*\Z/


end
