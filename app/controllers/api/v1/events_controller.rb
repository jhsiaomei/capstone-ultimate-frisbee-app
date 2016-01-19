class Api::V1::EventsController < ApplicationController
  def index
    @events = Event.all
    @user_events = current_user.events
  end
end
