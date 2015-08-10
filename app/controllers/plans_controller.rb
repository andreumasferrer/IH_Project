class PlansController < ApplicationController

  before_action :authorize_user
  before_action :group_members_only, only: [:index, :create, :supercreate]
  before_action :group_members_only_plan, only: [:show]
  before_action :plan_owner_only, only: [:edit, :update, :destroy]

  def index
    @group = Group.find(params[:group_id]) || (render 'layouts/404')
    @members = @group.users.order(:first_name, :email)
    subscriptons_ok = current_user.plan_subscriptions.where(status: 'OK')
    @plans_ok = subscriptons_ok.map{|subs| subs.plan}
    @plans_ok = @plans_ok.select{ |plan| plan.group == @group}
    subscriptons_ko = current_user.plan_subscriptions.where(status: 'KO')
    @plans_ko = subscriptons_ko.map{|subs| subs.plan}
    @plans_ko = @plans_ko.select{ |plan| plan.group == @group}
    @plans_not_responded = @group.plans.where('id NOT IN (?)', @plans_ok + @plans_ko)



  end

  def show
    @plan = Plan.find(params[:id]) || (render 'layouts/404')
    @plan_subscription = PlanSubscription.find_by(user: current_user, plan: @plan)
    @best_date = @plan.best_date
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
      redirect_to plan_path(@plan) #, notice: 'Plan was successfully created.'
    else
      flash[:alert] = "Can't create plan"
      render :new
    end
  end

  def supercreate
    @plan = current_user.plans.new(plan_params)
    @plan.group = Group.find(params[:plan][:group_id])
    @plan.status = :PLANNING

    if !@plan.save
      flash[:alert] = "Can't create plan"
      render :new
    end

    if (params[:plan_date][:start_date] != '')
      @plan_date = @plan.plan_dates.new(plan_date_params)
      @plan_date.all_day = true

      if !@plan_date.save
        flash[:alert] = "Can't create date proposal"
        render :new
      end
    end

    if (params[:plan_location][:name] != '')
      @plan_location = @plan.plan_locations.new(plan_location_params)

      if !@plan_location.save
        flash[:alert] = "Can't create location proposal"
        render :new
      end
    end

    redirect_to plan_path(@plan)

  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])

    @plan.update(plan_params)

    if (params[:plan][:plan_date_id])
      @plan.plan_date_id = params[:plan][:plan_date_id]
    end

    if @plan.save
      redirect_to plan_path(@plan) #, notice: 'Plan was successfully updated.'
    else
      flash[:alert] = "Can't update plan"
      render :edit
    end
  end

  def destroy
    Plan.destroy(params[:id])
    redirect_to plans_path #, notice: 'Plan was successfully deleted.'
  end

  private

  def plan_params
    params.require(:plan).permit(:group_id, :name, :short_desc, :long_desc, :status, :main_image)
  end

  def plan_date_params
    params.require(:plan_date).permit(:start_date, :end_date, :all_day)
  end

  def plan_location_params
    params.require(:plan_location).permit(:name, :description, :address)
  end

  def group_members_only
    group = params[:group_id]? Group.find(params[:group_id]) : Group.find(params[:plan][:group_id])

    unless current_user && current_user.joined_groups.includes(group).count > 0
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to groups_path
    end
  end

  def group_members_only_plan
    plan = Plan.find(params[:id])
    unless current_user && current_user.joined_groups.includes(plan.group).count > 0
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to groups_path
    end
  end

  def plan_owner_only
    plan = Plan.find(params[:id])

    unless current_user && plan.user == current_user
      flash[:message] = 'Access denied. You must be the plan owner.'
      redirect_to groups_path
    end
  end

end
