# Go to http://wiki.merbivore.com/pages/init-rb
 
require 'config/dependencies.rb'
 
use_orm :datamapper
use_test :rspec
use_template_engine :haml
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '05aee93758a7dffc70ddacade4b780b5d9e0ca39f6818417fee1e628ea6641717d417aa699c6051cc2ed396b6bca8e72815bda109d6dfaabf77fa8e602bbd4c8'  # required for cookie session store
end
 
Merb::BootLoader.before_app_loads do
  # use public/sass folder to store sass templates
  Merb::Plugins.config[:sass] ||= {}
  Merb::Plugins.config[:sass][:template_location] = "#{Merb.root}/public/sass"
end
 
# Run this after App/Plugins are loaded
Merb::BootLoader.after_app_loads do
  # add initializers
  Dir["#{Merb.root}/config/initializers/**/*.rb"].sort.each do |initializer|
    require(initializer)
  end
end

