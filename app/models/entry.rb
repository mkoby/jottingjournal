class Entry < ActiveRecord::Base
  belongs_to :user
  has_one :location, :class_name => "EntryLocation", :dependent => :destroy
  has_many :photos, :class_name => "EntryPhoto", :dependent => :destroy
  attr_accessible :contents

  before_save :hash_entry

  scope :favorites, :conditions => { :is_favorite => true }

  def shorten_contents(count = 512)
    if contents.length >= count 
      shortened = contents[0, count]
      splitted = shortened.split(/\s/)
      words = splitted.length
      splitted[0, words-1].join(" ") + ' ...'
    else 
      contents
    end
  end

  private

  def hash_entry
    self.entry_hash = Digest::SHA1.hexdigest(self.contents)
  end

end
