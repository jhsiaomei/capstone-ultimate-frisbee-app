class Event < ActiveRecord::Base
  belongs_to :field
  has_many :user_events
  has_many :users, through: :user_events
  has_many :event_times
end
