class GroupsController < ApplicationController
  before_action :require_login!, except: [:index, :show]

  def index
    @groups = Group.all.order(:name)
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

    flash[:notice] = "You created this group."
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

    flash[:notice] = "You edited this group."
    redirect_to "/groups/#{@group.id}"
  end

  def destroy
    group = Group.find_by(id: params[:id])
    group.destroy
    user_groups = UserGroup.where(group_id: group.id)
    user_groups.each do |user_group|
      user_group.destroy
    end

    flash[:notice] = "You deleted this event."
    redirect_to "/groups"
  end

  private
    def require_login!
    unless current_user
      redirect_to "/groups"
    end
  end

end
