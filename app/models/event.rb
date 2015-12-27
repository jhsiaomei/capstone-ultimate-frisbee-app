class Event < ActiveRecord::Base
  belongs_to :field
  has_many :users, through: :user_events
end
