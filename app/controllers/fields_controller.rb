class FieldsController < ApplicationController
  before_action :require_login!, except: [:index, :show]

  def index
    @fields = Field.all.order(:name)
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

    flash[:notice] = "You added this field."
    redirect_to "/fields/#{@field.id}"
  end

  def show
    @field = Field.find(params[:id])
    if @field.street_address != ""
      @field_placeholder = "#{@field.street_number} #{@field.street_address} | #{@field.city}, #{@field.state} #{@field.zip_code}"
    else
      @field_placeholder = "#{@field.intersection}"
    end
    field_conditions = @field.field_conditions
    if field_conditions == [] || field_conditions == nil
      @field_conditions = false
    else
      @field_conditions = field_conditions.order(created_at: :desc).limit(3)
    end
  end

  def edit
    @field = Field.find(params[:id])
    if @field.intersection != ""
      @field_placeholder = ""
    elsif @field.street_address == ""
      @field_placeholder = ""
    else
      @field_placeholder = "#{@field.street_number} #{@field.street_address}, #{@field.city}, #{@field.state}, #{@field.zip_code}"
    end
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

    flash[:notice] = "You updated this field."
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
