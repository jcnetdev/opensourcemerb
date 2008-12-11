class User
  include DataMapper::Resource
  
  has n, :bookmarks
  has n, :projects, :through => :bookmarks
  has n, :submitted, :class_name => "Project", :child_key => [:owner_id]
  
  has n, :activities
  has n, :comments, :child_key => [:owner_id]
  has n, :hosted_instances, :child_key => [:owner_id]
  has n, :screenshots, :child_key => [:owner_id]
  has n, :versions, :child_key => [:owner_id]
  
  property :id,     Serial
  property :login,  String
  property :email,  String
  property :identity_url,  String
  property :crypted_password, String, :size => 40
  property :salt, String, :size => 40
  property :remember_token, String
  property :remember_token_expires_at, DateTime
  property :ip_address, String

  # time stamps
  property :activated_at, DateTime
  property :deleted_at, DateTime
  
  # profile fields
  property :name, String
  property :profile, Text
  property :homepage, String
  
  # flags
  property :registered, Boolean, :field => "signed_up"
  property :admin, Boolean

  property :show_alert, Boolean
  property :show_welcome, Boolean
  property :spammer, Boolean
  
  # misc fields
  property :forgot_password_expire, DateTime
  property :forgot_password_hash, String
  property :bookmark_blob, Text
  timestamps :at
  
  # Virtual attribute for the unencrypted password
  attr_accessor :password
  attr_accessor :skip_email
  
  # :registering context validations
  validates_present :login, :when => :registering
  validates_is_unique :login, :with => /^\w+$/i, :allow_nil => true
  validates_length  :login, :in => (3..40), :when => :registering

  validates_format :email, :as => :email_address, :when => :registering
  validates_length :email, :in => (3..100), :when => :registering
  validates_is_unique :email, :allow_nil => true
  
  validates_present :password, :when => :registering
  validates_present :password_confirmation, :when => :registering
  validates_length :password, :in => (4..40), :when => :registering
  validates_is_confirmed :password_confirmation, :when => :registering
  
  before :save, :encrypt_password

  def to_s
    if registered?      
      return self.login unless self.login.blank?
      return self.name unless self.name.blank?    
    end
    return "Anonymous"
  end
  
  # remove a project from user's bookmarks
  def remove_bookmark(project)
    bookmark_to_remove = self.bookmarks.find_by_project_id(project.id)
    bookmark_to_remove.destroy
    self.update_attribute(:bookmark_blob, "#{self.bookmark_blob}".gsub("|#{project.id}|", ""))
  end
  
  # check if a project is bookmarked
  def bookmarked?(project)
    "#{self.bookmark_blob}".include?("|#{project.id}|")
  end
  
  # refresh the bookmark blob for user
  def refresh_bookmark_blob!
    blob = ""
    self.projects.each do |p|
      blob << "|#{p.id}|"
    end
    self.update_attributes(:bookmark_blob => blob)
  end
  
  # refresh all bookmark blobs for users
  def self.refresh_all_bookmark_blobs
    all.each do |u|
      u.refresh_bookmark_blob!
    end
  end
  
  # One time show for alerts to send out (new features etc..)
  def show_alert!
    if !self.show_welcome? and self.show_alert?
      self.update_attribute(:show_alert, false)
      return true
    else
      return false
    end
  end
  
  # One time show for welcome message
  def show_welcome!
    if self.show_welcome?
      self.update_attribute(:show_welcome, false)
      return true
    else
      return false
    end
  end
  
  def is_spammer!
    self.spammer = true
    self.save!
    
    self.comments.each{|r| r.destroy}
    self.hosted_instances.each{|r| r.destroy}
    self.screenshots.each{|r| r.destroy}
    self.versions.each{|r| r.destroy}
    self.bookmarks.each{|r| r.destroy}
    self.activities.each{|r| r.destroy}
  end
  
  def self.clear_spam
    User.find(:all, :conditions => {:spammer => true}).each do |user|
      user.is_spammer!
    end
  end
    
  protected
    def encrypt_password
      return if password.blank? or !signed_up?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
end
