class PlanDate < ActiveRecord::Base
  belongs_to :plan

  has_many :plan_subscription_ok_dates
  has_many :plan_subscriptions, through: :plan_subscription_ok_dates

  validates :start_date, presence: true
end
