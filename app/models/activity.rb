class Activity
  include DataMapper::Resource
  
  property  :id, Serial
  property  :user_name, String
  property  :action_name, String
  
  belongs_to :user
end
