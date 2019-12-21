# -*- encoding: utf-8 -*-
# stub: railties 6.0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "railties".freeze
  s.version = "6.0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/rails/rails/issues", "changelog_uri" => "https://github.com/rails/rails/blob/v6.0.2.1/railties/CHANGELOG.md", "documentation_uri" => "https://api.rubyonrails.org/v6.0.2.1/", "mailing_list_uri" => "https://groups.google.com/forum/#!forum/rubyonrails-talk", "source_code_uri" => "https://github.com/rails/rails/tree/v6.0.2.1/railties" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Heinemeier Hansson".freeze]
  s.bindir = "exe".freeze
  s.date = "2019-12-18"
  s.description = "Rails internals: application bootup, plugins, generators, and rake tasks.".freeze
  s.email = "david@loudthinking.com".freeze
  s.executables = ["rails".freeze]
  s.files = ["exe/rails".freeze]
  s.homepage = "https://rubyonrails.org".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--exclude".freeze, ".".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Tools for creating, working with, and running Rails applications.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, ["= 6.0.2.1"])
      s.add_runtime_dependency(%q<actionpack>.freeze, ["= 6.0.2.1"])
      s.add_runtime_dependency(%q<rake>.freeze, [">= 0.8.7"])
      s.add_runtime_dependency(%q<thor>.freeze, [">= 0.20.3", "< 2.0"])
      s.add_runtime_dependency(%q<method_source>.freeze, [">= 0"])
      s.add_development_dependency(%q<actionview>.freeze, ["= 6.0.2.1"])
    else
      s.add_dependency(%q<activesupport>.freeze, ["= 6.0.2.1"])
      s.add_dependency(%q<actionpack>.freeze, ["= 6.0.2.1"])
      s.add_dependency(%q<rake>.freeze, [">= 0.8.7"])
      s.add_dependency(%q<thor>.freeze, [">= 0.20.3", "< 2.0"])
      s.add_dependency(%q<method_source>.freeze, [">= 0"])
      s.add_dependency(%q<actionview>.freeze, ["= 6.0.2.1"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, ["= 6.0.2.1"])
    s.add_dependency(%q<actionpack>.freeze, ["= 6.0.2.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0.8.7"])
    s.add_dependency(%q<thor>.freeze, [">= 0.20.3", "< 2.0"])
    s.add_dependency(%q<method_source>.freeze, [">= 0"])
    s.add_dependency(%q<actionview>.freeze, ["= 6.0.2.1"])
  end
end
