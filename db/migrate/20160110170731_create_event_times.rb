class CreateEventTimes < ActiveRecord::Migration
  def change
    create_table :event_times do |t|
      t.string :event_id
      t.datetime :start_datetime
      t.datetime :stop_datetime

      t.timestamps null: false
    end
  end
end
