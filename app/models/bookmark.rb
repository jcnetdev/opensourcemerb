class Bookmark
  include DataMapper::Resource
  
  property :id, Serial
  
  belongs_to :user
  belongs_to :project
  
  timestamps :at

end
