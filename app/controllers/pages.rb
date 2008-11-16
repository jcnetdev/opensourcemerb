class Pages < Application

  # ...and remember, everything returned from an action
  # goes to the client...
  def about
    render
  end
  
  def tell_friend
    @tell_friend = TellFriend.new(params[:tell_friend])
    @tell_friend.valid?
    if button_pressed?(:send)
      if @tell_friend.send_msg(current_or_anon_user)
        flash[:success] = "Sent Message. Thanks for helping to promote #{AppConfig.site_name}!"
        redirect_to about_url
      end
    elsif button_pressed?(:preview)
      @preview = true
    end
  end
  
  def show
    render
  end
  
end
