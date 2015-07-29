class PlanSubscription < ActiveRecord::Base

  belongs_to :user
  belongs_to :plan

  has_many :plan_subscription_ok_dates
  has_many :plan_dates, through: :plan_subscription_ok_dates

  STATUSES = %w(OK KO)

  validates_uniqueness_of :user_id, :scope => :plan_id
  validates_inclusion_of :status, in: STATUSES



end
