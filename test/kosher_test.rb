# encoding: UTF-8
require 'minitest/autorun'

require_relative '../lib/kosher'

begin
  require 'pry'
  rescue LoadError
end

include Kosher

class TestKosher < MiniTest::Unit::TestCase
  def test_prices
    unit = Unit.new(:cents    => '1000',
                    :currency => 'EUR')
    assert_equal '10,00 €', unit.price.format

    shipping = Shipping.new(:available => true,
                            :cents     => '300',
                            :currency  => 'EUR')
    assert_equal '3,00 €', shipping.price.format

    offer = Offer.new(:shipping => shipping,
                      :unit     => unit)
    assert_equal '13,00 €', offer.price.format
  end

  def test_venues
    assert_equal 'Amazon.com',   Venue.find(1).name
    assert_equal 'Amazon.co.uk', Venue.find(2).name

    offer = Offer.new(:venue_id => 1)
    assert_equal Venue.find(1), offer.venue
  end

  def test_validation
    assert_raises(Structure::InvalidRecord) { Detail.new.kosher? }
    detail = Detail.new(:condition => 1)
    assert detail.kosher?

    assert_raises(Structure::InvalidRecord) { Shipping.new.kosher? }
    shipping = Shipping.new(:available => true,
                            :cents     => 100,
                            :currency  => 'USD')
    assert shipping.kosher?

    assert_raises(Structure::InvalidRecord) { Seller.new.kosher? }
    seller = Seller.new(:name => 'John Doe')
    assert seller.kosher?

    assert_raises(Structure::InvalidRecord) { Offer.new.kosher? }
    offer = Offer.new(:detail   => detail,
                      :shipping => shipping,
                      :seller   => seller,
                      :unit     => Unit.new,
                      :venue_id => 1)
    assert offer.kosher?
  end

  def test_venues
    assert_kind_of Venue, Venue.first
    assert 'Amazon.com', Venue.find(1).name
    assert_nil Venue.find(0)
  end

  def test_amazon_venues
    assert_equal 8, Venue.amazon.size
  end
end
