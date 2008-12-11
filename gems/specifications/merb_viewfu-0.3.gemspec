# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb_viewfu}
  s.version = "0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacques Crocker"]
  s.date = %q{2008-11-28}
  s.description = %q{View Helpers for Title, Meta tags, Browser Detect, and Common Tag Helpers}
  s.email = %q{merbjedi@gmail.com}
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["LICENSE", "README", "Rakefile", "lib/browser_detect", "lib/browser_detect/helper.rb", "lib/headliner", "lib/headliner/helper.rb", "lib/headliner/README", "lib/merb_viewfu.rb", "lib/view_fu", "lib/view_fu/meta_helper.rb", "lib/view_fu/tag_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://merbjedi.com/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{View Helpers for Title, Meta tags, Browser Detect, and Common Tag Helpers}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb>, [">= 1.0"])
    else
      s.add_dependency(%q<merb>, [">= 1.0"])
    end
  else
    s.add_dependency(%q<merb>, [">= 1.0"])
  end
end
