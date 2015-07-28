class PlansController < ApplicationController

  def index
    @plans = Plan.all
    @members = User.all #TO DO: Change when group model is added
  end

  def show
    @plan = Plan.find(params[:id]) || (render "layouts/404")
    @plan_date = @plan.plan_dates.new
    @plan_location = @plan.plan_locations.new
  end

  def new
    @plan = Plan.new
  end

  def create

    @plan = current_user.plans.new(plan_params)

    if @plan.save
      redirect_to plans_path, notice: 'Plan was successfully created.'
    else
      flash[:alert] = "Can't create plan"
      render :new
    end
  end

  private

  def plan_params
		params.require(:plan).permit(:name, :short_desc, :long_desc)
  end

end
