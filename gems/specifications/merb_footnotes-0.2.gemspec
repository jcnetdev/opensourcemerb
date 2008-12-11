# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb_footnotes}
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacques Crocker"]
  s.date = %q{2008-11-28}
  s.description = %q{Provides an extensible footnotes debugging bar to Merb development mode}
  s.email = %q{merbjedi@gmail.com}
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.files = ["LICENSE", "README", "Rakefile", "lib/merb_footnotes", "lib/merb_footnotes/filter.rb", "lib/merb_footnotes/formatter.rb", "lib/merb_footnotes/instrumentation.rb", "lib/merb_footnotes/notes", "lib/merb_footnotes/notes/abstract_note.rb", "lib/merb_footnotes/notes/controller_note.rb", "lib/merb_footnotes/notes/cookies_note.rb", "lib/merb_footnotes/notes/env_note.rb", "lib/merb_footnotes/notes/files_note.rb", "lib/merb_footnotes/notes/filters_note.rb", "lib/merb_footnotes/notes/javascripts_note.rb", "lib/merb_footnotes/notes/layout_note.rb", "lib/merb_footnotes/notes/log_note.rb", "lib/merb_footnotes/notes/params_note.rb", "lib/merb_footnotes/notes/partials_note.rb", "lib/merb_footnotes/notes/queries_note.rb", "lib/merb_footnotes/notes/routes_note.rb", "lib/merb_footnotes/notes/session_note.rb", "lib/merb_footnotes/notes/stylesheets_note.rb", "lib/merb_footnotes/notes/view_note.rb", "lib/merb_footnotes.rb", "spec/merb_footnotes_spec.rb", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://merbjedi.com/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Provides an extensible footnotes debugging bar to Merb development mode}

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
