# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb_comatose}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacques Crocker"]
  s.date = %q{2008-11-23}
  s.description = %q{Partial Port of Comatose with focus on rendering from Comatose Pages (no admin yet)}
  s.email = %q{merbjedi@gmail.com}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "lib/class_options.rb", "lib/comatose", "lib/comatose/comatose_drop.rb", "lib/comatose/configuration.rb", "lib/comatose/page_wrapper.rb", "lib/comatose/processing_context.rb", "lib/comatose/version.rb", "lib/liquid", "lib/liquid/block.rb", "lib/liquid/context.rb", "lib/liquid/document.rb", "lib/liquid/drop.rb", "lib/liquid/errors.rb", "lib/liquid/extensions.rb", "lib/liquid/file_system.rb", "lib/liquid/htmltags.rb", "lib/liquid/standardfilters.rb", "lib/liquid/standardtags.rb", "lib/liquid/strainer.rb", "lib/liquid/tag.rb", "lib/liquid/template.rb", "lib/liquid/variable.rb", "lib/liquid.rb", "lib/merb_comatose", "lib/merb_comatose/merbtasks.rb", "lib/merb_comatose.rb", "lib/redcloth.rb", "lib/support", "lib/support/class_options.rb", "lib/text_filters", "lib/text_filters/markdown.rb", "lib/text_filters/markdown_smartypants.rb", "lib/text_filters/none.rb", "lib/text_filters/rdoc.rb", "lib/text_filters/simple.rb", "lib/text_filters/textile.rb", "lib/text_filters.rb", "spec/merb_comatose_spec.rb", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://merbjedi.com/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Partial Port of Comatose with focus on rendering from Comatose Pages (no admin yet)}

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
