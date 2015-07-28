class PlanLocationsController < ApplicationController

    def create
      @plan = Plan.find(params[:plan_id])

      @plan_location = @plan.plan_locations.new(plan_location_params)

      if @plan_location.save
        redirect_to plan_path(@plan), notice: 'Your location was successfully created.'
      else
        flash[:alert] = "Can't create location proposal"
        render 'plans/show'
      end
    end

    private

    def plan_location_params
      params.require(:plan_location).permit(:name, :description, :address)
    end


end
