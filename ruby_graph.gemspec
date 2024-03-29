# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ruby_graph"
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dominick LoBraico"]
  s.date = "2011-11-13"
  s.description = "TODO: longer description of your gem"
  s.email = "dj@lobraico.com"
  s.executables = ["isomorphism"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/isomorphism",
    "lib/ruby_graph.rb",
    "lib/ruby_graph/graph.rb",
    "spec/ruby_graph/graph_spec.rb",
    "spec/ruby_graph_spec.rb",
    "spec/spec_helper.rb",
    "spec/test_input/1/a",
    "spec/test_input/1/b",
    "spec/test_input/1/out",
    "spec/test_input/10/a",
    "spec/test_input/10/b",
    "spec/test_input/10/out",
    "spec/test_input/2/a",
    "spec/test_input/2/b",
    "spec/test_input/2/out",
    "spec/test_input/3/a",
    "spec/test_input/3/b",
    "spec/test_input/3/out",
    "spec/test_input/4/a",
    "spec/test_input/4/b",
    "spec/test_input/4/out",
    "spec/test_input/5/a",
    "spec/test_input/5/b",
    "spec/test_input/5/out",
    "spec/test_input/6/a",
    "spec/test_input/6/b",
    "spec/test_input/6/out",
    "spec/test_input/7/a",
    "spec/test_input/7/b",
    "spec/test_input/7/out",
    "spec/test_input/8/a",
    "spec/test_input/8/b",
    "spec/test_input/8/out",
    "spec/test_input/9/a",
    "spec/test_input/9/b",
    "spec/test_input/9/out"
  ]
  s.homepage = "http://github.com/pygatea/ruby_graph"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "A very simple graph library for Ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

