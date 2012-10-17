class EntryLocation < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :city, :latitude, :longitude, :state
end
