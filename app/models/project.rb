class Project
  include DataMapper::Resource
  
  # schema
  property :id, Serial
  
  property :title, String
  property :description, Text
  property :short_description, String
  property :requirements, String
  
  property :author_name, String
  property :author_contact, String
  
  property :homepage_url, String
  property :source_url, String

  property :thumb_url, String
  property :preview_url, String
  property :screenshot_url, String
  property :download_url, String
  
  property :license, String
  
  property :in_gallery, Boolean
  property :is_submitted, Boolean
  
  property :promoted_at, DateTime
  property :last_changed, DateTime
  
  # use this for tagging support
  # property :tag_blob, Text
  
  property :downloads, Integer, :default => 0
  
  belongs_to :owner, :class_name => "User", :child_key => [:owner_id]
  belongs_to :author, :class_name => "User", :child_key => [:author_id]
  
  timestamps :at
  
  # relationships
  has n, :comments
  has n, :bookmarks
  has n, :screenshots
  has n, :versions
  has n, :hosted_instances

  # list the gallery projects
  def self.in_gallery(options = {})
    all(:conditions => {:in_gallery => true, :is_submitted => true}, :order => [:promoted_at.desc]).all(options)
  end
  
  # list the upcoming projects
  def self.upcoming(options = {})
    all(:conditions => {:in_gallery => false, :is_submitted => true}, :order => [:last_changed.desc]).all(options)
  end
  
  # Search a projects collection by query string
  def self.search(results, query)
    conditions = {}
    conditions[:title.like] = "%#{query}%"
    conditions[:short_description.like] = "%#{query}%"
    conditions[:description.like] = "%#{query}%"
    
    results.all(:conditions => conditions)
  end
  
  # Search a projects collection by tag
  def self.match_tag(results, tag)
    results.all(:conditions => {:tag_blob.like => "%#{tag}%"})
  end
  
  def self.per_page
    AppConfig.projects_per_page
  end

  def meta_keywords
    self.tag_list.join(" ")
  end
  
  def screenshot_url
    orig = attribute_get("screenshot_url")
    if orig.blank?
      "/images/default_screenshots/medium.png"
    else
      orig
    end
  end
  
  # checks if a given user owns this project
  def owned_by?(user)
    return false unless user.is_a? User
    
    # allow admins and project owners to edit
    user.admin? or self.owner == user
  end

  # TAGGING STUBS: todo
  def tag_list
    []
  end
  
  # RATING STUBS: todo
  def rated_count
    0
  end
  
  def rating_average
    0.0
  end
  
  def rating_in_halves
    0
  end
  
end
