class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.create(
      name: params[:name],
      description: params[:description],
      field_id_1: params[:field_id_1],
      field_id_2: params[:field_id_2],
      field_id_3: params[:field_id_3],
      group_type: params[:group_type],
      )
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
    redirect_to "/groups/#{@group.id}"
  end

  def show
    @group = Group.find_by(id: params[:id])
  end

  def edit
    @group = Group.find_by(id: params[:id])
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
    redirect_to "/groups"
  end
end
