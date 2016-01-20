class PagesController < ApplicationController
  def index
    @fields = []
    fields = Field.all
    fields.each do |field|
      if field.events != []
        @fields << field
      end
    end
    @fields

    events = Event.where("start_datetime > current_timestamp")
    @event = events.order(:start_datetime).first
  end
end
