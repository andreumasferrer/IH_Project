class Plan < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: "user_id"
  has_many :plan_dates, dependent: :destroy
  has_many :plan_locations, dependent: :destroy
  has_many :plan_subscriptions, dependent: :destroy
  has_many :subscribers, class_name: 'User', through: :plan_subscriptions

  validates :name, :user_id, presence: true


end
