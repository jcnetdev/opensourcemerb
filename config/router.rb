# Merb::Router is the request routing mapper for the merb framework.
#
# You can route a specific URL to a controller / action pair:
#
#   match("/contact").
#     to(:controller => "info", :action => "contact")
#
# You can define placeholder parts of the url with the :symbol notation. These
# placeholders will be available in the params hash of your controllers. For example:
#
#   match("/books/:book_id/:action").
#     to(:controller => "books")
#   
# Or, use placeholders in the "to" results for more complicated routing, e.g.:
#
#   match("/admin/:module/:controller/:action/:id").
#     to(:controller => ":module/:controller")
#
# You can specify conditions on the placeholder by passing a hash as the second
# argument of "match"
#
#   match("/registration/:course_name", :course_name => /^[a-z]{3,5}-\d{5}$/).
#     to(:controller => "registration")
#
# You can also use regular expressions, deferred routes, and many other options.
# See merb/specs/merb/router.rb for a fairly complete usage sample.

Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  # # Adds the required routes for merb-auth using the password slice
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")

  authenticate do
    # authentication resources
    resource :session
    resources :users do
      member :activate, :method => :get
      member :spammer, :method => :put
      member :edit_password, :method => :get

      collection :reset_password, :method => :any
    end
    
    # project resources
    resources :projects do
      member :submit, :method => :put
      member :approve, :method => :put
      member :details, :method => :get
      member :rate, :method => :post
      member :download, :method => :get
      collection :upcoming, :method => :get
      collection :activity, :method => :get
    
      resource :bookmark
      resources :comments
      resources :versions do 
        member :set, :method => :put
      end
      resources :screenshots do
        member :set, :method => :put
      end
      resources :hosted_instances do
        member :set, :method => :put
      end
    end
    match("/forgot_password").to(:controller => "users", :action => "forgot_password")
  
    # additional project routes
    with(:controller => "projects") do
      match("/search").to(:action => "search").name(:search)
      match("/bookmarks").to(:action => "bookmarks").name(:bookmarks)
      match("/gallery").to(:action => "index").name(:gallery)
      match("/upcoming").to(:action => "upcoming").name(:upcoming)

      # feed routes
      match("/feed.:format").to(:action => "feed")
      with(:format => "atom") do
        match("/projects.atom").to(:action => "index").name(:projects_feed)
        match("/upcoming.atom").to(:action => "upcoming").name(:upcoming_feed)
        match("/feed").to(:action => "feed", :format => "atom")
      end
    end
  
    # page routes
    match("/about").to(:controller => "pages", :action => "about").name(:about)
    match("/blog").to(:controller => "pages", :action => "blog").name(:blog)

    match("/").to(:controller => "projects", :action => "index").name(:root)
  end
end