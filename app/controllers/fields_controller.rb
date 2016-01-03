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
      street_address: params[:street_address],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      )
    @field.save
    redirect_to '/'
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
