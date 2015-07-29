class PlanSubscriptionOkDate < ActiveRecord::Base
  belongs_to :plan_subscription
  belongs_to :plan_date

  # def next_order_value
  #   max_ok_date = self.plan_subscription.plan_subscription_ok_dates.max_by do |subscription_ok_date|
  #     subscription_ok_date.order
  #   end
  #
  #   if !max_ok_date.nil?
  #     return max_ok_date.order+1
  #   else
  #     return 0
  #   end
  #
  # end
end
