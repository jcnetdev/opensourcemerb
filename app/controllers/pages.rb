class Pages < Application

  def about
    render
  end
  
  def tell_friend
    @tell_friend = TellFriend.new(params[:tell_friend])
    @tell_friend.valid?
    if button_pressed?(:send)
      if current_user and @tell_friend.send_msg(current_user)
        flash[:success] = "Sent Message. Thanks for helping to promote #{AppConfig.site_name}!"
        return redirect(url(:about))
      end
    elsif button_pressed?(:preview)
      @preview = true
    end
    render
  end
  
  def show
    render
  end
  
end
