module Merb
  module UsersHelper
    def name_display(user)
      if current_user and current_user == user
        return "Your"
      elsif !user.name.blank?
        return "#{user.name}'s"
      elsif !user.login.blank?
        return "#{user.login}'s"
      else
        return "User's"
      end
    end
    
    def hide_login_panel?
      @hide_login_panel
    end

    def hide_login_panel
      @hide_login_panel = true
    end
    
    def logged_in?
      session.authenticated?
    end
    
    def admin?
      session.authenticated? and session.admin?
    end
    
    def current_user
      session.user
    end
    
  end
end