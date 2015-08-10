class PlanDatesController < ApplicationController

  before_action :authorize_user

  def create
    @plan = Plan.find(params[:plan_id])

    @plan_date = @plan.plan_dates.new(plan_date_params)

    if @plan_date.save
      redirect_to plan_path(@plan) #, notice: 'Your date was successfully created.'
    else
      flash[:alert] = "Can't create date proposal"
      render 'plans/show'
    end
  end

  def destroy
    plan_date = PlanDate.destroy(params[:id])
    redirect_to plan_path(plan_date.plan)#, notice: 'Date was successfully deleted.'
  end

  private

  def plan_date_params
    params.require(:plan_date).permit(:start_date, :end_date, :all_day)
  end

end
