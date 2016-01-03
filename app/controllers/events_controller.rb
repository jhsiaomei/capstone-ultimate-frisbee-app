class EventsController < ApplicationController
  before_action :require_login!, except: [:index, :show]

  def index
    @events = Event.all
    @active_events = "active"
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(
      name: params[:name],
      event_type: params[:event_type],
      date_start: params[:date_start],
      date_stop: params[:date_stop],
      time_start: params[:time_start],
      time_stop: params[:time_stop],
      description: params[:description],
      field_id: params[:field_id],
      )
    @event.save

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
