class Version
  include DataMapper::Resource
  include Paperclip::Resource

  include Mixins::ProjectItem  
  
  property :id, Serial
  property :notes, Text
  
  property :title, String
  property :link, String
  
  timestamps :at
  
  has_attached_file :download
  
  # check if a version is the project's default
  def is_default?
    if self.project and self.project.download_url == self.download.url
      return true
    else
      return false
    end    
  end
end