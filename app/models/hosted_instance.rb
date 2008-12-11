class HostedInstance
  include DataMapper::Resource
  include Mixins::ProjectItem  
  
  property :id, Serial
  
  property :title, String
  property :url, String
  property :description, String
  
  timestamps :at
end
