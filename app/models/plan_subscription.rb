class PlanSubscription < ActiveRecord::Base

  belongs_to :user
  belongs_to :plan

  STATUSES = %w(OK KO)

  validates_uniqueness_of :user_id, :scope => :plan_id
  validates_inclusion_of :status, in: STATUSES


  
end
