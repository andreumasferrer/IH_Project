class PlanSubscriptionOkDate < ActiveRecord::Base
  belongs_to :plan_subscription
  belongs_to :plan_date
end
