class Entry < ActiveRecord::Base
  belongs_to :user
  has_one :location, :class_name => "EntryLocation", :dependent => :destroy
  attr_accessible :contents

  before_save :hash_entry

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
    self.entry_hash = Digest::SHA1.hexdigest(self.contents + Time.now.to_s)
  end

end
