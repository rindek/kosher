require 'minitest/autorun'
require_relative '../lib/kosher'
begin
  require 'pry'
rescue LoadError
end

include Kosher

class TestKosher < MiniTest::Unit::TestCase
  def test_prices
    unit = Unit.new(cents: 100, currency: 'USD')
    assert_equal '$1.00', unit.price.format

    ship = Shipping.new(cents: 100, currency: 'USD')
    assert_equal '$1.00', ship.cost.format

    offer = Offer.new(unit: unit, shipping: ship)
    assert_equal '$2.00', offer.price.format
  end
end
