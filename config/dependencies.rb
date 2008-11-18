# dependencies are generated using a strict version, don't forget to edit the dependency versions when upgrading.
merb_gems_version = "1.0"
dm_gems_version   = "0.9.6"

# For more information about each component, please read http://wiki.merbivore.com/faqs/merb_components
dependency "merb-action-args", merb_gems_version
dependency "merb-assets", merb_gems_version  
dependency "merb-cache", merb_gems_version   
dependency "merb-helpers", merb_gems_version 
dependency "merb-mailer", merb_gems_version  
dependency "merb-slices", merb_gems_version  
dependency "merb-param-protection", merb_gems_version
dependency "merb-exceptions", merb_gems_version

# allow sass
dependency "merb-haml", merb_gems_version

# dependency "merb-auth-core", merb_gems_version
# dependency "merb-auth-more", merb_gems_version
# dependency "merb-auth-slice-password", merb_gems_version

dependency "dm-core", dm_gems_version
dependency "dm-aggregates", dm_gems_version
dependency "dm-migrations", dm_gems_version
dependency "dm-timestamps", dm_gems_version
dependency "dm-types", dm_gems_version
dependency "dm-validations", dm_gems_version
dependency "dm-ar-finders", dm_gems_version

# plugins
dependency "merb_has_flash", ">= 0.9.6"

 
# my plugins
dependency "merb-plugins-app-config", ">= 0.3"
dependency "merb-plugins-viewfu", ">= 0.1"
dependency "merb-plugins-footnotes", ">= 0.0.1"