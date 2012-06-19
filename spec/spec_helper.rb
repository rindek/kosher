begin
  require 'pry'
rescue LoadError
end

begin
  require 'simplecov'
  SimpleCov.start { add_filter '/spec/' }
rescue LoadError
end

require 'rspec'
