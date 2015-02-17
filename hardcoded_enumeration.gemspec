# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: hardcoded_enumeration 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "hardcoded_enumeration"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["\u{141}ukasz \u{15a}liwa"]
  s.date = "2015-02-17"
  s.description = "Hardcoded enumeration plugin"
  s.email = "lukasz.sliwa@apptamers.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "generators/enumerated/enumerated_generator.rb",
    "generators/enumerated/templates/enumerated.rb",
    "init.rb",
    "lib/hardcoded_enumeration.rb",
    "lib/hardcoded_enumeration/active_record_extensions.rb",
    "lib/hardcoded_enumeration/base.rb"
  ]
  s.homepage = "http://github.com/lukaszsliwa/hardcoded_enumeration"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Hardcoded enumeration plugin"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

