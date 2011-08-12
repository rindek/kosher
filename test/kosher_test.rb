# encoding: UTF-8
require 'test/unit'

require_relative '../lib/kosher'

class TestKosher < Test::Unit::TestCase
  def test_unit_price
    unit = Kosher::Unit.new(:cents => '100', :currency => 'JPY')
    assert_equal '¥1.00', unit.price.format
  end

  def test_shipping_cost
    shipping = Kosher::Shipping.new(:cents => '100', :currency => 'EUR')
    assert_equal '1,00 €', shipping.cost.format
  end

  def test_venue
    assert_equal 'Amazon.com', Kosher::Venue.find(1).name
    assert_equal 'Amazon.co.uk', Kosher::Venue.find(2).name
  end

  def test_pricing
    unit = Kosher::Unit.new :condition => 1,
                            :cents     => 100,
                            :currency  => 'USD'

    shipping = Kosher::Shipping.new :available => true,
                                    :cents     => 100,
                                    :currency  => 'USD'

    offer = Kosher::Offer.new :unit     => unit,
                              :seller   => Kosher::Seller.new,
                              :shipping => shipping

    assert_equal Money.new(200, 'USD'), offer.price
  end

  def test_shipping_validations
    assert_raise(Kosher::Invalid) { Kosher::Shipping.new.kosher? }
    unit = Kosher::Shipping.new :available => true,
                                :cents     => 100,
                                :currency  => 'USD'
    assert unit.kosher?
  end

  def test_unit_validations
    assert_raise(Kosher::Invalid) { Kosher::Unit.new.kosher? }
    unit = Kosher::Unit.new :condition => 1,
                            :cents     => 100,
                            :currency  => 'USD'
    assert unit.kosher?
  end
end
