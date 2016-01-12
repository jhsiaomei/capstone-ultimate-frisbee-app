class EventsController < ApplicationController
  before_action :require_login!, except: [:index, :show]

  def index
    @events = Event.all
    @upcoming_events_times = EventTime.where("start_datetime >= ?", Date.today)
    @upcoming_events = @upcoming_events_times.map {|upcoming_events_time| Event.find(upcoming_events_time.event.id)}.to_set
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(
      name: params[:name],
      event_type: params[:event_type],
      field_id: params[:field_id],
      description: params[:description]
      )
    @event.save

    start_datetime = DateTime.strptime(params[:start_datetime], "%m/%d/%Y %H:%M %P").to_time
    stop_datetime = DateTime.strptime(params[:stop_datetime], "%m/%d/%Y %H:%M %P").to_time    

    @event_time = EventTime.new(
      event_id: @event.id,
      start_datetime: start_datetime,
      stop_datetime: stop_datetime
      )
    @event_time.save

    @user_event = UserEvent.create(
      user_id: current_user.id,
      event_id: @event.id,
      is_admin: true
      )

    redirect_to "/events"
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.update(
      name: params[:name],
      event_type: params[:event_type],
      date_start: params[:date_start],
      date_stop: params[:date_stop],
      time_start: params[:time_start],
      time_stop: params[:time_stop],
      description: params[:description],
      field_id: params[:field_id],
      )
    redirect_to "/events/#{@event.id}"
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
    redirect_to '/events'
  end
end
