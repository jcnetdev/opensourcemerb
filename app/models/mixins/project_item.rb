# Defines methods used between project items
module Mixins
  module ProjectItem  
    # Autowire associations with project and user
    def self.included(base)
      base.class_eval do 
        # relations
        belongs_to :project
        belongs_to :owner, :class_name => "User", :child_key => [:owner_id]

        attr_accessor :antispam
      
        after :save, :set_activity
        after :destroy, :set_activity
      end    
    end
  
    # Define ownership method
    def owned_by?(user)
      return false unless user.is_a? User
    
      if self.owner_id == user.id
        # return true if user owns the item
        return true
      elsif self.project and self.project.owned_by?(user)
        # return true if user owns the project
        return true
      else
        return false
      end
    end
  
    # check if a project item is spam
    def is_spam?
      if self.owner and self.owner.spammer?
        return true
      else
        return false
      end
    end
  
    def set_activity
      if self.project and self.project.is_submitted?
        Activity.create_from(self)
      end
    end
  end
end