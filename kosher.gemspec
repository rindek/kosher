# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "kosher/version"

Gem::Specification.new do |s|
  s.name        = "kosher"
  s.version     = Kosher::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Paper Cavalier"]
  s.email       = ["code@papercvalier.com"]
  s.homepage    = ""
  s.summary     = %q{Kosher validates descriptions}
  s.description = %q{Have you ever wondered if you should buy a book?}

  s.rubyforge_project = "kosher"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency("rspec", ["~> 2.4.0"])
end
