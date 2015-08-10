class PlanSubscriptionOkDatesController < ApplicationController

  before_action :authorize_user

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

end
