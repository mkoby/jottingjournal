class Entry < ActiveRecord::Base
  belongs_to :user
  has_one :entry_location, :dependent => :destroy
  has_one :entry_photo, :dependent => :destroy
  attr_accessible :contents, :entry_photo_attributes, :location, :photo

  before_save :hash_entry

  scope :favorites, :conditions => { :is_favorite => true }
  accepts_nested_attributes_for :entry_photo, :reject_if => :all_blank

  def location
    self.entry_location
  end

  def photo
    return self.entry_photo.photo if self.has_photo?
    return nil
  end

  def has_photo?
    self.entry_photo.nil? || self.entry_photo.new_record? ? false : true
  end

  def has_location?
    if self.entry_location.nil?
      return false
    elsif self.entry_location.latitude.nil? || self.entry_location.longitude.nil?
      return false
    end

    return true
  end

  def shorten_contents(count = 512)
    shortened = contents

    if shortened.length >= count 
      shortened = contents[0, count]
      splitted = shortened.split(/\s/)
      words = splitted.length
      shortened = splitted[0, words-1].join(" ") + ' ...'
    end
    
    shortened
  end

  def pretty_time
    self.created_at.utc.strftime("%B %d, %Y %I:%M%p UTC")
  end

  def contents_as_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(self.contents)
  end

  private

  def hash_entry
    self.entry_hash = Digest::SHA1.hexdigest(self.contents)
  end

end
