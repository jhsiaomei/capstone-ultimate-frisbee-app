
json.fields @fields do |field|
  json.name field.name
  json.lat field.latitude
  json.lng field.longitude
  json.events field.events do |event|
    json.id event.id
    json.name event.name
    json.start event.start_datetime
  end
end