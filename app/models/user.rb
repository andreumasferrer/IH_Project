class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :plans, dependent: :destroy
  has_many :plan_subscriptions, dependent: :destroy
  has_many :subscribed_plans, source: :plan, through: :plan_subscriptions


  def show_name
    return first_name+" "+last_name unless first_name.nil?
    email
  end

end
