class Api::V1::EventsController < ApplicationController
  def index
    events = Event.where("start_datetime > current_timestamp")
    @events = events.order(:start_datetime)
  end
end
