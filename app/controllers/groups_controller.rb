class GroupsController < ApplicationController

  before_action :authorize_user
  before_action :group_members_only, only: [:update]

  def index
    @group = Group.new
    @groups = current_user.groups.order(:name)
  end

  def create
    @group = current_user.groups.new(group_params)
    @group.users << current_user

    if @group.save
      redirect_to groups_path,  notice: 'Group was successfully created.'
    else
      flash[:alert] = "Can't create group"
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])

    @group.update(group_params)

    if @group.save
      redirect_to request.referer, notice: 'Group was successfully updated.'
    else
      flash[:alert] = "Can't update group"
      redirect_to request.referer
    end

  end

  private

  def group_params
    params.require(:group).permit(:name, :main_image)
  end

  def group_members_only
    group = Group.find(params[:id])
    unless current_user && current_user.joined_groups.includes(group)
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to request.referer
    end
  end

end
