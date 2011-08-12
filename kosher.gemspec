# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'kosher/version'

Gem::Specification.new do |s|
  s.name        = 'kosher'
  s.version     = Kosher::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Hakan Ensari']
  s.email       = 'code@papercavalier.com'
  s.homepage    = 'https://github.com/hakanensari/kosher'
  s.summary     = %q{Online trade, abstracted}
  s.description = %q{Online trade, abstracted}

  {
    'activemodel' => '~> 3.0',
    'money'       => '~> 3.7',
    'structure'   => '~> 0.15'
  }.each do |lib, version|
    s.add_runtime_dependency lib, version
  end

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']
end
