class Entry < ActiveRecord::Base
  belongs_to :user
  attr_accessible :contents, :entry_hash
end
