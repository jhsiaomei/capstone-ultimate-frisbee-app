class UserGroupsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user_group = UserGroup.create(
      user_id: current_user.id,
      group_id: params[:group_id],
      )
  
    flash[:success] = "You joined this group!"
    redirect_to "/groups"
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
