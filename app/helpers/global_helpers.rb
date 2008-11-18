module Merb
  module GlobalHelpers
    include Merb::NavHelper
  
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
  end
end
