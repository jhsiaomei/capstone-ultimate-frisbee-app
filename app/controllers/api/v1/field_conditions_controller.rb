class Api::V1::FieldConditionsController < ApplicationController
  def index
    field_conditions = FieldCondition.all
    render json: field_conditions
  end
end
