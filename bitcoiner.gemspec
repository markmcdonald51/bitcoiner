# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bitcoiner/version"

Gem::Specification.new do |s|
  s.name        = "bitcoiner"
  s.version     = Bitcoiner::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dan Neumann"]
  s.email       = ["danneumanntx@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{add bitcoin interaction to your rails app.}
  s.description = %q{add bitcoin interaction to your rails app. ported davout's code into a gem.}

  s.add_dependency "addressable"

  s.rubyforge_project = "bitcoiner"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
