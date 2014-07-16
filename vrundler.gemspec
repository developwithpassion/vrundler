# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib",__FILE__)
require "vrundler/version"

Gem::Specification.new do |s|
  s.name        = "vrundler"
  s.version     = VRundler::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license    = 'MIT'
  s.authors     = ["Develop With Passion®"]
  s.email       = ["open_source@developwithpassion.com"]
  s.homepage    = "http://www.developwithpassion.com"
  s.summary     = %q{Simple vim plugin manager}
  s.description = %q{Lightweight ruby tool to manage my vim plugin ecosystem}
  s.rubyforge_project = "vrundler"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "thor", "0.19.1"
end
