module Merb::GlobalHelpers

  def production?
    Merb.env == "production"
  end

  def flash_boxes(*args)
  end
  
end
