class EntryPhoto < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :photo, :photo_cache
  mount_uploader :photo, EntryPhotoUploader
end
