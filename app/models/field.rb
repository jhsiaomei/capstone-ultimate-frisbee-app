class Field < ActiveRecord::Base
  has_many :field_conditions
  has_many :events
  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    if intersection == "" 
      "#{street_number} #{street_address}, #{city}, #{state} #{zip_code}"
    else
      "#{intersection}"
    end
  end
end
