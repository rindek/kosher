require 'rubygems'
require 'bundler/setup'

require 'test/unit'

require File.expand_path('../lib/kosher', File.dirname(__FILE__))

class TestKosher < Test::Unit::TestCase
  def test_price
    price = Kosher::Price.new
    assert_raise(TypeError) { price.to_money }

    price.cents = "100"
    assert_equal(price.to_money.cents, 100)
  end

  def test_shipping
    shipping = Kosher::Shipping.new
    shipping.kosher = true
    assert_equal(shipping.available?, true)
  end
end
