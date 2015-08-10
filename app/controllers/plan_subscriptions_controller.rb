class PlanSubscriptionsController < ApplicationController

  before_action :authorize_user
  before_action :group_members_only, only: [:create]
  before_action :group_members_only_plan_subscription, only: [:update]

  def create
    @plan = Plan.find(params[:plan_id])

    @plan_subscription = @plan.plan_subscriptions.new(plan_subscription_params)
    @plan_subscription.user = current_user

    if @plan_subscription.save
      if params[:status] == 'OK'
        # flash[:notice] = "You joined the plan: #{@plan.name}"
      else
        flash[:notice] = "You dismissed the plan: #{@plan.name}"
      end
    else
      flash[:alert] = "Can't create subscription"
    end
    redirect_to request.referer
  end


  def update

    @plan_subscription = PlanSubscription.find(params[:id])
    @plan_subscription.update(plan_subscription_params)

    if @plan_subscription.save
      if params[:status] == 'OK'
        # flash[:notice] = "You joined the plan: #{@plan_subscription.plan.name}"
      else
        flash[:notice] = "You dismissed the plan: #{@plan_subscription.plan.name}"
      end
    else
      flash[:alert] = "Can't update subscription"
    end
    redirect_to request.referer

  end

  private

  def plan_subscription_params
    params.permit(:status)
  end


  def group_members_only
    plan = Plan.find(params[:plan_id])
    unless current_user && current_user.joined_groups.includes(plan.group).count > 0
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to groups_path
    end
  end

  def group_members_only_plan_subscription
    plan = PlanSubscription.find(params[:id]).plan
    unless current_user && current_user.joined_groups.includes(plan.group).count > 0
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to groups_path
    end
  end

end
