module Merb
  module NavHelper
    def menu_item(title, link, selected = false)
      link_to menu_tag(title), link, :class => (selected ? "select" : "")
    end

    def menu_tag(title)
      tag(:span, tag(:span, title, :class => "menu_right"), :class => "menu_left")
    end

    def active_tab(set_tab = nil)
      if set_tab
        @active_tab ||= set_tab
      end
    
      return @active_tab
    end
    
    def projects_rss
      AppConfig.rss_url || formatted_projects_url(:atom)
    end

    def upcoming_rss
      AppConfig.upcoming_rss_url || formatted_upcoming_projects_url(:atom)
    end

    def activity_rss
      AppConfig.upcoming_activity_url || formatted_activity_projects_url(:atom)
    end
  end
end
