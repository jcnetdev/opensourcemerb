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
  end
end
