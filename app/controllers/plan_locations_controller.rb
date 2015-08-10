class PlanLocationsController < ApplicationController

  before_action :authorize_user

  def create
    @plan = Plan.find(params[:plan_id])

    @plan_location = @plan.plan_locations.new(plan_location_params)

    if @plan_location.save
      redirect_to plan_path(@plan)#, notice: 'Your location was successfully created.'
    else
      flash[:alert] = "Can't create location proposal"
      render 'plans/show'
    end
  end

  def destroy
    plan_location = PlanLocation.destroy(params[:id])
    redirect_to plan_path(plan_location.plan)#, notice: 'Location was successfully deleted.'
  end

  private

  def plan_location_params
    params.require(:plan_location).permit(:name, :description, :address)
  end
end
