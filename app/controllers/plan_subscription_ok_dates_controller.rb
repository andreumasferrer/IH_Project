class PlanSubscriptionOkDatesController < ApplicationController

  before_action :authorize_user
  before_action :group_members_only, only: [:create]

  def create
    @plan_subscription = PlanSubscription.find(params[:plan_subscription_id])
    @plan_date = PlanDate.find(params[:plan_date_id])

    @plan_subscription_ok_date = @plan_subscription.plan_subscription_ok_dates.new
    @plan_subscription_ok_date.plan_date = @plan_date
    @plan_subscription_ok_date.order = 0 # TO DO: Mantain order of accepted dates

    if @plan_subscription_ok_date.save
      # flash[:notice] = 'The date has been accepted'
    else
      flash[:alert] = "Can't accept date"
    end
    redirect_to request.referer
  end

  def destroy
    plan_subscription_ok_date = PlanSubscriptionOkDate.destroy(params[:id])
    redirect_to plan_path(plan_subscription_ok_date.plan_date.plan), notice: 'Date was successfully declined.'
  end

  def group_members_only
    plan = PlanSubscription.find(params[:plan_subscription_id]).plan
    unless current_user && current_user.joined_groups.includes(plan.group).count > 0
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to groups_path
    end
  end

  def group_members_only_plan_subscription_ok_date
    plan = PlanSubscriptionOkDate.find(params[:id]).plan_subscription.plan
    unless current_user && current_user.joined_groups.includes(plan.group).count > 0
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to groups_path
    end
  end



end
