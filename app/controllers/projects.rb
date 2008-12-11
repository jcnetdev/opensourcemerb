class Projects < Application
  def index
    @projects = filter(Project.in_gallery).paginate(:page => params[:page])
    @sidebar = Project.upcoming(:limit => AppConfig.project_list_max)
    
    render
  end
  
  def upcoming
    @active_tab = :upcoming
    
    @projects = filter(Project.upcoming).paginate(:page => params[:page])
    @sidebar = Project.in_gallery(:limit => AppConfig.project_list_max)
    
    render :index
  end
  
  def show
    @project = Project.get(params[:id].to_s.to_i)
    render
  end
  
  protected
  # filters output using params (query and tag)
  def filter(results)
    if params[:q].present?
      results = Project.search(results, params[:q])
    end
    
    if params[:tag].present?
      results = Project.match_tag(results, params[:tag])
    end
    
    return results
  end
end