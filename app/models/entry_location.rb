class EntryLocation < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :latitude, :longitude
  attr_writer :address

  MAP_URL_BASE = "https://maps.google.com/?t=h&q="

  reverse_geocoded_by :latitude, :longitude  do |obj, results|
    if geo = results.first
      obj.city = geo.city
      obj.state = geo.state_code
      obj.zipcode = geo.postal_code
    end
  end

  after_validation :reverse_geocode

  def map_link
    map_query_string = self.zipcode ? self.zipcode : "#{self.city},#{self.state}"
    map_query_string = "#{self.latitude},#{self.longitude}" if map_query_string.nil? || map_query_string == ","

    return MAP_URL_BASE + map_query_string
  end
end
