class Screenshots < ProjectBase
  # ...and remember, everything returned from an action
  # goes to the client...
  def index
    render
  end
  
  # post screenshots
  def create
    debugger
    # check original size of screenshots
    orig_size = @project.screenshots.size
    
    @valid_screenshots = []
    @invalid_screenshots = []
    
    # build screenshots from param hash
    params[:screenshots].each do |screenshot|
      @screenshot = @project.screenshots.build(screenshot)
      @screenshot.owner = current_user
      if @screenshot.save
        @valid_screenshots << @screenshot
      else
        @invalid_screenshots << @screenshot
      end
    end
    
    if @valid_screenshots.size > 0
      begin
        @project.mark_changed! unless current_user.spammer?
      rescue
        Merb.logger.error("UNABLE TO UPLOAD SCREENSHOTS")
      end
      
      if orig_size == 0
        @project.set_default_screenshot(@valid_screenshots.first)
      end
      
      flash[:success] = "Screenshots Uploaded."
      redirect resource(@project)
    else
      @invalid_screenshots.each{|screenshot| set_flash(screenshot) }
      redirect resource(@project)+"#screenshots_add"
    end
  end
  
  
end
