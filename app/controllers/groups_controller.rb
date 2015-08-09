class GroupsController < ApplicationController

  def index
    @group = Group.new
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

  end

  private

  def group_params
    params.require(:group).permit(:name, :main_image)
  end

end
