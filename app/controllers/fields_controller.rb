class FieldsController < ApplicationController
  before_action :require_login!, except: [:index, :show]

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
    @field_placeholder = "#{@field.street_number} #{@field.street_address} | #{@field.city}, #{@field.state} #{@field.zip_code}"
  end

  def edit
    @field = Field.find(params[:id])
    @field_placeholder = "#{@field.street_number} #{@field.street_address}, #{@field.city}, #{@field.state}, #{@field.zip_code}"
  end

  def update
    field = Field.find(params[:id])
    field.update(
      name: params[:name],
      intersection: params[:intersection],
      street_number: params[:street_number],
      street_address: params[:route],
      city: params[:locality],
      state: params[:administrative_area_level_1],
      zip_code: params[:postal_code]
      )
    redirect_to "/fields/#{field.id}"
  end

  def destroy
  end

  private
  
  def require_login!
    unless current_user
      redirect_to "/fields"
    end
  end

end
