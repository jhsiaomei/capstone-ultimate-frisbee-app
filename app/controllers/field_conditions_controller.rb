class FieldConditionsController < ApplicationController
  def index
    @field_conditions = FieldCondition.all
  end

  def new
    @field_condition = FieldCondition.new
  end

  def create
    @field_condition = FieldCondition.new(
      field_id: params[:field_id],
      condition: params[:condition]
      )
    @field_condition.save

    redirect_to "/"
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
