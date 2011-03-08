$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'rubygems'
require 'bundler/setup'

require 'minitest/spec'
require 'minitest/mock'
require 'ruby-debug'
require 'kosher'

class Object
  def method_missing(sym, *args, &block)
    case sym
    when /^must_be_(.*)/
      msg = "Expected #{self} to be #{$1}"
      MiniTest::Spec.current.assert(self.send("#{$1}?"), msg)
    when /^must_not_be_(.*)/
      msg = "Expected #{self} not to be #{$1}"
      MiniTest::Spec.current.assert(!self.send("#{$1}?"), msg)
    else
      super
    end
  end
end

MiniTest::Unit.autorun
