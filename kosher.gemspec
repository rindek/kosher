# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'kosher/version'

Gem::Specification.new do |s|
  s.name        = 'kosher'
  s.version     = Kosher::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Paper Cavalier']
  s.email       = 'code@papercavalier.com'
  s.homepage    = 'https://rubygems.org/gems/kosher'
  s.summary     = %q{A somewhat overengineered attempt to abstract bookselling into a set of models}
  s.description = %q{Kosher is a somewhat overengineered attempt to abstract bookselling into a set of models.}

  s.rubyforge_project = 'kosher'

  s.add_dependency('json', '~> 1.5.1')
  s.add_dependency('money', '~> 3.6.1')
  s.add_development_dependency('rspec', '~> 2.5.0')
  s.add_development_dependency('ruby-debug19', '~> 0.11.6')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
