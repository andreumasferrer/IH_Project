class Group < ActiveRecord::Base
  has_many :users
  has_many :plans, dependent: :destroy

  has_attached_file :main_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing_group.png"
  validates_attachment_content_type :main_image, :content_type => /\Aimage\/.*\Z/


end
