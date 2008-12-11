class ProjectBase < Application
  before :get_project
  
  protected
  def get_project
    @project = Project.get(params[:project_id].to_s.to_i)
  end
end