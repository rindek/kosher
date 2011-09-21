# encoding: UTF-8
require 'minitest/autorun'
require 'mocha'

require_relative '../lib/kosher'

begin
  require 'pry'
  rescue LoadError
end

include Kosher

class TestKosher < MiniTest::Unit::TestCase
  def test_unit_price
    unit = Unit.new(:cents => 100, :currency => 'USD')
    assert_equal '$1.00', unit.price.format
  end

  def test_shipping_price
    shipping = Shipping.new(:cents => 100, :currency => 'USD')
    assert_equal '$1.00', shipping.price.format
  end

  def test_shipping_availability
    shipping = Shipping.new(:available => true)
    assert shipping.available?
  end

  def test_condition_type
    condition = Condition.new(:grade => '1')
    assert condition.new?
    refute condition.used?
  end

  def test_offer_price
    offer = Offer.new

  end
  # def test_money
  #   unit     = Unit.new(    :cents    => '1000',
  #                           :currency => 'EUR')
  #   shipping = Shipping.new(:available => true,
  #                           :cents     => '300',
  #                           :currency  => 'EUR')
  #   offer    = Offer.new(   :shipping => shipping,
  #                           :unit     => unit)

  #   assert_equal '10,00 €', unit.price.format
  #   assert_equal '3,00 €',  shipping.price.format
  #   assert_equal '13,00 €', offer.price.format
  # end

  # def test_validation
  #   assert_raises(Structure::InvalidRecord) { Condition.new.kosher? }
  #   condition = Condition.new(:grade => 1)
  #   assert condition.kosher?

  #   assert_raises(Structure::InvalidRecord) { Shipping.new.kosher? }
  #   shipping = Shipping.new(:available => true,
  #                           :cents     => 100,
  #                           :currency  => 'USD')
  #   assert shipping.kosher?

  #   assert_raises(Structure::InvalidRecord) { Seller.new.kosher? }
  #   seller = Seller.new(:name => 'John Doe')
  #   assert seller.kosher?

  #   assert_raises(Structure::InvalidRecord) { Offer.new.kosher? }
  #   offer = Offer.new(:condition => condition,
  #                     :shipping  => shipping,
  #                     :seller    => seller,
  #                     :unit      => Unit.new,
  #                     :venue     => 'Amazon.com')
  #   assert offer.kosher?
  # end
end
