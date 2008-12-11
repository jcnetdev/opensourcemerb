module Merb
  module GlobalHelpers
    include Merb::CommentsHelper
    include Merb::ComponentsHelper
    include Merb::NavHelper
    include Merb::ProjectsHelper
    include Merb::TabsHelper
    include Merb::UsersHelper

    def production?
      Merb.env?(:production)
    end

    def flash_boxes(*args)
      unless @flash_shown
        @flash_shown = true
        partial "layout/flash_boxes"
      else
        ""
      end
    end
    
    def dom_id(obj)
      if obj
        "#{obj.class.to_s.downcase}_#{obj.id}"
      else
        ""
      end
    end
    
    # Easily link to an image
    def link_to_image(image_path, url, options={})
      # setup vertical alignment
      vert_align = options.delete(:vert)
      if vert_align.nil?
        vert_style = "vertical-align: middle"
      elsif vert_align.blank?
        vert_style = ""
      else
        vert_style = "vertical-align: #{vert_align.to_i}px"
      end
      
      label = options.delete(:label)

      output = link_to(image_tag(image_path, :class => "vert-middle", :style => "#{vert_style}"), url, options)
      if label
        output << "&nbsp;"+ link_to(label, url, options)
      end
      return output
    end
  
    def image_submit(src, attrs = {})
      attrs[:type]  ||= "image"
      attrs[:name]  ||= "submit"
      attrs[:src] ||= src
      self_closing_tag(:input, attrs)
    end
    
    def progress(img_path = nil)
      # set default progress image
      img_path ||= "progress.gif"

      tag :div, image_tag(img_path), :class => "progress hidden"
    end
    
    def paging?(list)
      list.is_a? WillPaginate::Collection
    end
    
    # Missing Rails Helper
    
    def pluralize(count, singular, plural = nil)
      "#{count || 0} " + ((count == 1 || count == '1') ? singular : (plural || singular.pluralize))
    end
    
    def simple_format(text, html_options={})
      start_tag = tag('p', html_options, true)
      text = text.to_s.dup
      text.gsub!(/\r\n?/, "\n")                    # \r\n and \r -> \n
      text.gsub!(/\n\n+/, "</p>\n\n#{start_tag}")  # 2+ newline  -> paragraph
      text.gsub!(/([^\n]\n)(?=[^\n])/, '\1<br />') # 1 newline   -> br
      text.insert 0, start_tag
      text << "</p>"
    end
    
    def link_to_if(condition, name, url='', options = {})
      link_to_unless !condition, name, url, options
    end
    
    def link_to_unless(condition, name, url='', options = {})
      if condition
        name
      else
        link_to(name, url, options)
      end
    end
    
  end
end