module Merb
  module TabsHelper
    def tabs(options={}, &block)
      # set up the options class param
      options[:class] ||= ""
    
      # append the css class "tabs" if it doesnt already exist
      options[:class] << " tabs" unless options[:class].include?("tabs")
    
      # allow ul_options
      nav_options = options.delete(:nav_options) || {}
    
      # build the html for the tabs
      haml_tag :div, options do
        # initialize instance navhtml
        @__tabs_navhtml = ""

        # build inner content
        inner_content = capture_haml(&block)

        # render navs first
        haml_concat tag(:ul, @__tabs_navhtml+clear, nav_options)
      
        # render inner content
        haml_concat inner_content
      
        haml_concat tag(:div, "", :class => "tab-bottom")
      
        # clear instance variable
        @__tabs_navhtml = nil
      end
    end
  
    # Give the tab a name and unique id
    def tab(name, tab_id , options={}, &block)
      # append an element to our nav_html
      @__tabs_navhtml << tag(:li, link_to(name, "##{tab_id}", :title => name), :class => options[:tab_class])
    
      # build our tab
      haml_tag :div, options.merge(:id => tab_id) do
        haml_concat capture(&block)
        haml_concat tag(:div, "", :style => "clear: both")
      end
    end
  
    def blank_tab
      @__tabs_navhtml << tag(:li, "&nbsp;", :class => "blank")
      return ""
    end
  end
end