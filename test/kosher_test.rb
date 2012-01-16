require 'minitest/autorun'
require_relative '../lib/kosher'

begin
  require 'pry'
rescue LoadError
end

include Kosher

class TestKosher < MiniTest::Unit::TestCase
  def test_new_condition
    condition = Condition.new

    condition.grade = 1
    assert condition.new?

    condition.grade = 2
    refute condition.new?
  end

  def test_fast_shipping
    shipping = Shipping.new
    refute shipping.fast?

    shipping.fast = true
    assert shipping.fast?
  end

  def test_kosher_offer
    condition = Condition.new
    seller = Seller.new
    shipping = Shipping.new
    offer = Offer.new(condition: condition,
                      seller:    seller,
                      shipping:  shipping)
    refute offer.kosher?

    condition.kosher = true
    seller.kosher = true
    assert offer.kosher?
  end

  def test_offer_price
    unit = Unit.new(cents: 100, currency: 'USD')
    ship = Shipping.new(cents: 100, currency: 'USD')
    offer = Offer.new(unit: unit, shipping: ship)
    assert_equal 200, offer.price.cents
    assert_equal 'USD', offer.price.currency.iso_code
  end
end
