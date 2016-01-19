json.events @user_events

json.events @user_events do |event|
  json.title event.name
  json.start event.start_datetime
  json.end event.stop_datetime
  json.editable event.description
end