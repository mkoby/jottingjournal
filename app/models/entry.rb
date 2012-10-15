class Entry < ActiveRecord::Base
  belongs_to :user
  attr_accessible :contents

  before_save :hash_entry

  private

  def hash_entry
    self.entry_hash = Digest::SHA1.hexdigest(self.contents + Time.now.to_s)
  end
end
