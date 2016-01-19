json.events @events

json.events @events do |event|
  json.title event.name
  json.start event.start_datetime
  json.end event.stop_datetime
  json.editable event.description
end