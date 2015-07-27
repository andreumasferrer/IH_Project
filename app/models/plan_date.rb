class PlanDate < ActiveRecord::Base
  belongs_to :plan

  validates :start_date, presence: true
end
