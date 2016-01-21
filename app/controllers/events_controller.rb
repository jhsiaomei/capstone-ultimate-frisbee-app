class EventsController < ApplicationController
  before_action :require_login!, except: [:index, :show]
  before_action :require_admin!, only: :edit

  def index
    events = Event.where("start_datetime > current_timestamp")
    @events = events.order(:start_datetime)
  end

  def new
    @event = Event.new
    @fields = Field.all
  end

  def create
    start_datetime = DateTime.strptime(params[:start_datetime], "%m/%d/%Y %H:%M %P").to_time
    stop_datetime = DateTime.strptime(params[:stop_datetime], "%m/%d/%Y %H:%M %P").to_time    

    @event = Event.new(
      name: params[:name],
      event_type: params[:event_type],
      field_id: params[:field_id],
      description: params[:description],
      start_datetime: start_datetime,
      stop_datetime: stop_datetime
      )
    @event.save

    @user_event = UserEvent.create(
      user_id: current_user.id,
      event_id: @event.id,
      is_admin: true
      )

    flash[:notice] = "You created this event."
    redirect_to "/events/#{@event.id}"
  end

  def show
    @event = Event.find(params[:id])
    @field = @event.field
    user_event = UserEvent.where("user_id = ? AND event_id = ?", current_user.id, params[:id]).first
    if user_event == [] || user_event == nil
      @user_event = false
    else
      @user_event = user_event.is_admin
    end
    if @field.intersection == ""
      @field_address = "#{@field.street_number} #{@field.street_address} | #{@field.city}, #{@field.state} #{@field.zip_code}"
    else
      @field_address = "#{@field.intersection}"
    end
  end

  def edit
    @event = Event.find(params[:id])
    @fields = Field.all    
  end

  def update
    start_datetime = DateTime.strptime(params[:start_datetime], "%m/%d/%Y %H:%M %P").to_time
    stop_datetime = DateTime.strptime(params[:stop_datetime], "%m/%d/%Y %H:%M %P").to_time    

    @event = Event.find(params[:id])
    @event.update(
      name: params[:name],
      event_type: params[:event_type],
      description: params[:description],
      field_id: params[:field_id],
      start_datetime: start_datetime,
      stop_datetime: stop_datetime
      )

    flash[:notice] = "You updated this event."
    redirect_to "/events/#{@event.id}"
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
    user_events = UserEvent.where(event_id: event.id)
    user_events.each do |user_event|
      user_event.destroy
    end

    flash[:notice] = "You deleted this event."
    redirect_to '/events'
  end

  private

  def require_login!
    unless current_user
      redirect_to "/events"
    end
  end

  def require_admin!
    event = Event.find(params[:id])
    user_event = UserEvent.where("user_id = ? AND event_id = ?", current_user.id, params[:id]).first
    if user_event == [] || user_event == nil
      redirect_to "/events/#{event.id}"
    elsif user_event.is_admin == false
      redirect_to "/events/#{event.id}"
    end
  end  
end
