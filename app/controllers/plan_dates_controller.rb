class PlanDatesController < ApplicationController

  before_action :authorize_user
  before_action :group_members_only, only: [:create]
  before_action :group_members_only_plan_date, only: [:destroy]


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


  def group_members_only
    plan = Plan.find(params[:plan_id])
    unless current_user && current_user.joined_groups.includes(plan.group).count > 0
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to groups_path
    end
  end

  def group_members_only_plan_date
    plan = PlanDate.find(params[:id]).plan
    unless current_user && current_user.joined_groups.includes(plan.group).count > 0
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to groups_path
    end
  end

end
