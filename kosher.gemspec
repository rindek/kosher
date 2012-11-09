# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'kosher/version'

Gem::Specification.new do |s|
  s.name        = 'kosher'
  s.version     = Kosher::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Hakan Ensari']
  s.email       = 'hakan.ensari@papercavalier.com'
  s.homepage    = 'https://github.com/papercavalier/kosher'
  s.summary     = %q{Kosher}

  s.add_runtime_dependency 'money',  '~> 5.0'
  s.add_runtime_dependency 'virtus', '~> 0.5.2'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']
end
