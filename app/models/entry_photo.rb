class EntryPhoto < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :photo
  mount_uploader :entry_photo, EntryPhotoUploader
end
