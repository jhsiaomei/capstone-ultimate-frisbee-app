class GroupsController < ApplicationController
  before_action :require_login!

  def index
    @groups = Group.all.order(:name)
    @active_groups = "active"
  end

  def new
    @fields = Field.all
  end

  def create
    @group = Group.create(
      name: params[:name],
      description: params[:description],
      field_id_1: params[:field_id_1],
      field_id_2: params[:field_id_2],
      field_id_3: params[:field_id_3],
      group_type: params[:group_type],
      )
    @user_group = UserGroup.create(
      user_id: current_user.id,
      group_id: @group.id,
      is_admin: true
      )

    flash[:success] = "You created this group!"
    redirect_to "/groups/#{@group.id}"
  end

  def show
    @group = Group.find_by(id: params[:id])
  end

  def edit
    @group = Group.find(params[:id])
    @fields = Field.all
  end

  def update
    @group = Group.find_by(id: params[:id])
    @group.update(
      name: params[:name],
      description: params[:description],
      field_id_1: params[:field_id_1],
      field_id_2: params[:field_id_2],
      field_id_3: params[:field_id_3],
      group_type: params[:group_type]
      )
    redirect_to "/groups/#{@group.id}"
  end

  def destroy
    @group = Group.find_by(id: params[:id])
    @group.destroy
    @user_group = UserGroup.find_by(group_id: @group.id)
    @user_group.destroy
    redirect_to "/groups"
  end
end
