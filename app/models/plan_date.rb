class PlanDate < ActiveRecord::Base
  belongs_to :plan

  has_many :plan_subscription_ok_dates
  has_many :plan_subscriptions, through: :plan_subscription_ok_dates

  validates :start_date, presence: true


  def accepted_by_user?(user)
    return false unless user
    return false unless self.plan.subscribers.include?(user)

    subscription_ok_date = get_subscription_ok_date(user)

    if subscription_ok_date
      return true
    else
      return false
    end
  end

  def get_subscription_ok_date(user)
    subscription = PlanSubscription.find_by(user: user, plan: self.plan)
    return PlanSubscriptionOkDate.find_by(plan_date: self, plan_subscription: subscription)
  end

end
