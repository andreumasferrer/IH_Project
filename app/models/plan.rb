class Plan < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :plan_dates
  has_many :plan_locations
end
