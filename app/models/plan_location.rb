class PlanLocation < ActiveRecord::Base
  belongs_to :plan

  validates :name, presence: true
end
