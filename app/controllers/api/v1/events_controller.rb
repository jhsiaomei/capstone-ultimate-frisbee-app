class Api::V1::EventsController < ApplicationController
  def index
    @events = Event.all
    user_events = current_user.events.where("start_datetime > current_timestamp")
    @user_events = user_events.order(:start_datetime)
  end
end
