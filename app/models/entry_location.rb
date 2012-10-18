class EntryLocation < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :latitude, :longitude
  attr_writer :address

  reverse_geocoded_by :latitude, :longitude  do |obj, results|
    if geo = results.first
      obj.city = geo.city
      obj.state = geo.state_code
    end
  end

  after_validation :reverse_geocode
end
