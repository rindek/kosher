require 'kosher/base'
require 'kosher/price'

require 'kosher/seller'
require 'kosher/shipping'
require 'kosher/unit'
require 'kosher/venue'

module Kosher
  class Offer < Structure
    include Comparable

    key :id
    key :seller
    key :shipping
    key :unit
    key :venue_id, Integer

    def <=>(other)
      if kosher? != other.kosher?
        kosher? ? -1 : 1
      else
        price <=> other.price
      end
    end

    def kosher?
      [seller, shipping, unit].all?(&:kosher?)
    end

    def price
      unit.price + shipping.price
    end

    def venue
      Venue.find(venue_id)
    end
  end
end
