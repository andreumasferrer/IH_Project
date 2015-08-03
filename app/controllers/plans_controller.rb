class PlansController < ApplicationController
  def index
    @members = User.all # TO DO: Change when group model is added
    subscriptons_ok = current_user.plan_subscriptions.where(status: 'OK')
    @plans_ok = subscriptons_ok.map{|subs| subs.plan}
    subscriptons_ko = current_user.plan_subscriptions.where(status: 'KO')
    @plans_ko = subscriptons_ko.map{|subs| subs.plan}
    @plans_not_responded = Plan.joins('LEFT JOIN plan_subscriptions ps ON ps.plan_id = plans.id').where('ps.id IS NULL')
  end

  def show
    @plan = Plan.find(params[:id]) || (render 'layouts/404')
    @plan_subscription = PlanSubscription.find_by(user: current_user, plan: @plan)
    @plan_date = PlanDate.new
    @plan_location = PlanLocation.new
    @users_joining = @plan.users_joining
    @users_dismissing = @plan.users_dismissing
    @users_not_responding = @plan.users_not_responding
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = current_user.plans.new(plan_params)
    @plan.status = :PLANNING

    if @plan.save
      redirect_to plan_path(@plan), notice: 'Plan was successfully created.'
    else
      flash[:alert] = "Can't create plan"
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)

    if @plan.save
      redirect_to plan_path(@plan), notice: 'Plan was successfully updated.'
    else
      flash[:alert] = "Can't update plan"
      render :edit
    end
  end

  def destroy
    Plan.destroy(params[:id])
    redirect_to plans_path, notice: 'Plan was successfully deleted.'
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :short_desc, :long_desc, :status, :main_image)
  end
end
