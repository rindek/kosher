require 'certainty'

require 'kosher/filter'
require 'kosher/price'

require 'kosher/detail'
require 'kosher/seller'
require 'kosher/shipping'
require 'kosher/unit'
require 'kosher/venue'

module Kosher
  class Offer < Structure
    include Comparable

    key :id,       String
    key :detail,   Detail
    key :seller,   Seller
    key :shipping, Shipping
    key :unit,     Unit
    key :venue_id, Integer

    validates_presence_of :detail, :seller, :shipping, :unit, :venue

    def <=>(other)
      if kosher? != other.kosher?
        kosher? ? -1 : 1
      else
        price <=> other.price
      end
    end

    def kosher?
      raise_error_if_invalid

      [seller, shipping, detail].all?(&:kosher?)
    end

    def price
      unit.price + shipping.price
    end

    def venue
      Venue.find(venue_id)
    end
  end
end
