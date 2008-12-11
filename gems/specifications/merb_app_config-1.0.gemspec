# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb_app_config}
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacques Crocker"]
  s.date = %q{2008-11-23}
  s.description = %q{Merb plugin that provides easy to use Application Configurations via YAML}
  s.email = %q{merbjedi@gmail.com}
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["LICENSE", "README", "Rakefile", "lib/application_config", "lib/application_config/config_builder.rb", "lib/application_config/view_helpers.rb", "lib/merb_app_config.rb", "lib/merbtasks.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://www.merbjedi.com/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Merb plugin that provides easy to use Application Configurations via YAML}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb>, [">= 1.0"])
      s.add_runtime_dependency(%q<merb-assets>, [">= 1.0"])
    else
      s.add_dependency(%q<merb>, [">= 1.0"])
      s.add_dependency(%q<merb-assets>, [">= 1.0"])
    end
  else
    s.add_dependency(%q<merb>, [">= 1.0"])
    s.add_dependency(%q<merb-assets>, [">= 1.0"])
  end
end
