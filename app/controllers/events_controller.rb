class EventsController < ApplicationController
  before_action :require_login!, except: [:index, :show]

  def index
    @events = Event.all
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

    redirect_to "/events"
  end

  def show
    @event = Event.find(params[:id])
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

    redirect_to "/events/#{@event.id}"
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
    redirect_to '/events'
  end
end
