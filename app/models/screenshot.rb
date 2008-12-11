class Screenshot
  include DataMapper::Resource
  include Paperclip::Resource  

  include Mixins::ProjectItem  
  
  property :id, Serial
  
  has_attached_file :screenshot, 
                            :styles => AppConfig.screenshot_sizes.marshal_dump,
                            :default_url => AppConfig.screenshot_default
  
  timestamps :at
end
