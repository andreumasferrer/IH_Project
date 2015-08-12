class GroupsController < ApplicationController

  before_action :authorize_user
  before_action :group_members_only, only: [:update]
  before_action :group_owner_only, only: [:new_member]

  def index
    @group = Group.new
    @groups = current_user.joined_groups.order(:name)
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


  def new_member
    @group = Group.find(params[:id])

    user = User.find_by(email: params[:user][:email])

    unless user
      user = User.new(email: params[:user][:email],
                      password: '12345678', password_confirmation: '12345678',
                      first_name: params[:user][:name])
      user.skip_confirmation!
    end

    @group.users << user

    if @group.save && user.save
      redirect_to request.referer, notice: 'Group member was successfully added.'
    else
      flash[:alert] = "Can't add member"
      redirect_to request.referer
    end

  end

  private

  def group_params
    params.require(:group).permit(:name, :main_image)
  end

  def group_owner_only
    group = Group.find(params[:id])
    unless current_user && group.user == current_user
      flash[:message] = 'Access denied. You must be the group owner.'
      redirect_to request.referer
    end
  end

  def group_members_only
    group = Group.find(params[:id])
    unless current_user && current_user.joined_groups.includes(group).count > 0
      flash[:message] = 'Access denied. You must be a group member.'
      redirect_to request.referer
    end
  end

end
