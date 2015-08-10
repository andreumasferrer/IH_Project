class PlanLocationsController < ApplicationController

  before_action :authorize_user
  before_action :group_members_only, only: [:create]
  before_action :group_members_only_plan_location, only: [:destroy]

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

  def group_members_only
    plan = Plan.find(params[:plan_id])
    unless current_user && current_user.joined_groups.includes(plan.group).count > 0
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to groups_path
    end
  end

  def group_members_only_plan_location
    plan = PlanLocation.find(params[:id]).plan
    unless current_user && current_user.joined_groups.includes(plan.group).count > 0
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to groups_path
    end
  end

end
