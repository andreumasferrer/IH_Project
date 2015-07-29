class PlanSubscriptionsController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])

    @plan_subscription = @plan.plan_subscriptions.new(plan_subscription_params)
    @plan_subscription.user = current_user

    if @plan_subscription.save
      if params[:status] == 'OK'
        flash[:notice] = "You joined the plan: #{@plan.name}"
      else
        flash[:notice] = "You dismissed the plan: #{@plan.name}"
      end
    else
      flash[:alert] = "Can't create subscription"
    end
    redirect_to request.referer
  end


  def update

  end

  private

  def plan_subscription_params
    params.permit(:status)
  end
end
