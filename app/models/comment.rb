class Comment
  include DataMapper::Resource
  include Mixins::ProjectItem  
  
  # schema
  property :id, Serial
  property :body, Text
  property :author_name, String
  property :author_email, String
  
  timestamps :at
    
  def self.initialize_from_user(user)
    comment = Comment.new
    if user.is_a? User
      comment.author_name = user.to_s
      comment.author_email = user.email
    end
    
    return comment
  end
  
end
