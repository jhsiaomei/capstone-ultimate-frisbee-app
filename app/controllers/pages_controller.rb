class PagesController < ApplicationController
  layout "banner"
  
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
    @events = events.order(:start_datetime).limit(4)
  end
end
