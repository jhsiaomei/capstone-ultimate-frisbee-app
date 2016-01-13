class FieldsController < ApplicationController
  before_action :require_login!

  def index
    @fields = Field.all
    @active_fields = "active"
  end

  def new
    @field = Field.new
  end

  def create
    @field = Field.new(
      name: params[:name],
      intersection: params[:intersection],
      street_number: params[:street_number],
      street_address: params[:route],
      city: params[:locality],
      state: params[:administrative_area_level_1],
      zip_code: params[:postal_code],
      )
    @field.save
    redirect_to '/fields'
  end

  def show
    @field = Field.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
