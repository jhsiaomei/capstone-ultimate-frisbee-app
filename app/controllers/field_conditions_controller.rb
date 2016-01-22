class FieldConditionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @field_condition = FieldCondition.new(
      field_id: params[:field_id],
      condition: params[:condition],
      user_id: current_user.id
      )
    @field_condition.save

    redirect_to "/fields/#{@field_condition.field_id}"
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
