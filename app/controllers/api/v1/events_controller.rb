class Api::V1::EventsController < ApplicationController
  def index
    @events = Event.all
    # user_events = current_user.events
    # puts '-------------'
    # puts current_user.events
    # puts '-------------'
    # render json: events
  end
end
