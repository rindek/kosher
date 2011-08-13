# encoding: UTF-8
require 'minitest/autorun'

require_relative '../lib/kosher'

class TestKosher < MiniTest::Unit::TestCase
  def test_unit_price
    unit = Kosher::Unit.new(:cents    => '100',
                            :currency => 'JPY')
    assert_equal '¥1.00', unit.price.format
  end

  def test_shipping_cost
    shipping = Kosher::Shipping.new(:cents    => '100',
                                    :currency => 'EUR')
    assert_equal '1,00 €', shipping.cost.format
  end

  def test_offer_price
    shipping = Kosher::Shipping.new(:cents    => 100,
                                    :currency => 'USD')
    unit = Kosher::Unit.new(:cents    => 100,
                            :currency => 'USD')
    offer = Kosher::Offer.new(:shipping => shipping,
                              :unit     => unit)
    assert_equal '$2.00', offer.price.format
  end

  def test_venue
    assert_equal 'Amazon.com', Kosher::Venue.find(1).name
    assert_equal 'Amazon.co.uk', Kosher::Venue.find(2).name
  end

  def test_venue_in_offer
    offer = Kosher::Offer.new(:venue_id => 1)
    assert_equal Kosher::Venue.find(1), offer.venue
  end

  def test_validation
    assert_raises(Kosher::Invalid) { Kosher::Unit.new.kosher? }
    unit = Kosher::Unit.new(:condition => 1,
                            :cents     => 100,
                            :currency  => 'USD')
    assert unit.kosher?

    assert_raises(Kosher::Invalid) { Kosher::Shipping.new.kosher? }
    shipping = Kosher::Shipping.new(:available => true,
                                    :cents     => 100,
                                    :currency  => 'USD')
    assert shipping.kosher?

    assert_raises(Kosher::Invalid) { Kosher::Offer.new.kosher? }
    offer = Kosher::Offer.new(:unit     => unit,
                              :shipping => shipping,
                              :seller   => Kosher::Seller.new,
                              :venue_id => 1)
    assert offer.kosher?

    offer.venue_id = 0
    assert_raises(Kosher::Invalid) { offer.kosher? }
  end

  def test_amazon_venues
    assert_equal 8, Kosher::Venue.amazon.size
  end
end
