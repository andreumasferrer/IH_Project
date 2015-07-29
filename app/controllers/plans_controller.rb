class PlansController < ApplicationController
  def index
    @plans = Plan.all
    @members = User.all # TO DO: Change when group model is added
  end

  def show
    @plan = Plan.find(params[:id]) || (render 'layouts/404')
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
    params.require(:plan).permit(:name, :short_desc, :long_desc)
  end
end
