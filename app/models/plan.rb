class Plan < ActiveRecord::Base
  belongs_to :user #owner, class_name: 'User', foreign_key: "user_id"
  has_many :plan_dates, dependent: :destroy
  has_many :plan_locations, dependent: :destroy
  has_many :plan_subscriptions, dependent: :destroy
  has_many :subscribers, source: :user, through: :plan_subscriptions

  STATUSES = %w(PLANNING ACCEPTED CANCELED)

  validates :name, :user, presence: true
  validates_inclusion_of :status, in: STATUSES

  def get_subscription(user)
    #plan_subscriptions.where(user_id: user.id).first #find_by
    plan_subscriptions.find_by(user_id: user.id)
  end

  def users_joining
    joining_subs = get_subscriptions_by_status(:OK)
    get_subscriptions_users(joining_subs)
  end

  def users_dismissing
    joining_subs = get_subscriptions_by_status(:KO)
    get_subscriptions_users(joining_subs)
  end

  #TO DO: Change when group model is added
  def users_not_responding
    # subscriptions_user_ids = self.plan_subscriptions.map {|subscription| subscription.user.id  }
    subscribers_user_ids = subscribers.pluck(:id) #subscribers.map {|user| user.id  }
    return User.all if subscribers_user_ids.empty?
    User.where('id NOT IN (?)',subscribers_user_ids)
  end

  private

  def get_subscriptions_by_status (status)
      #plan_subscriptions.select { |subscription|  subscription.status == status.to_s  }
      plan_subscriptions.where(status: status.to_s)
  end

  def get_subscriptions_users (subscriptions_arr)
    subscriptions_arr.map { |subscription| subscription.user  }
  end

end
