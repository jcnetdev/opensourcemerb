class Application < Merb::Controller
  def current_user
    u = User.first
    unless u
      u = User.create :login => "anon_user"
    end
    return u
  end
end