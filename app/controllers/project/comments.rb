class Comments < ProjectBase
  def index
    redirect resource(@project)
  end
  
  def show
    @comment = Comment.get(params[:id])
    redirect resource(@project)+"#comment-#{@comment.id}"
  end
end