class FieldConditionsController < ApplicationController
  before_action :require_login!

  def index
    @field_conditions = FieldCondition.all
  end

  def new
    @field_condition = FieldCondition.new
  end

  def create
    @field_condition = FieldCondition.new(
      field_id: params[:field_id],
      condition: params[:condition],
      user_id: current_user.id
      )
    @field_condition.save

    redirect_to "/field_conditions"
  end

  def show
    @field_condition = FieldCondition.find_by(id: params[:id])
  end

  def edit
    @field_condition = FieldCondition.find_by(id: params[:id])
  end

  def update
    @field_condition = FieldCondition.find_by(id: params[:id])
    @field_condition.update(
      field_id: params[:field_id],
      condition: params[:condition]
      )
    redirect_to "/field_conditions/#{@field_condition.id}"
  end

  def destroy
  end
end
