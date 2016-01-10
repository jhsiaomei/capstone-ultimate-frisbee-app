class EventTime < ActiveRecord::Base
  belongs_to :event

  def display_start_time
    start_datetime.strftime("%-m/%-e/%-Y %-l:%M %p")
  end

  def display_stop_time
    stop_datetime.strftime("%-m/%-e/%-Y %-l:%M %p")
  end
end
