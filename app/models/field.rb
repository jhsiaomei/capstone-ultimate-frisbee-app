class Field < ActiveRecord::Base
  has_many :field_conditions
  has_many :events
end
