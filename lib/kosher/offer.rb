module Kosher
  class Offer < Structure
    include Comparable

    key :kosher, Boolean
    key :new, Boolean
    key :shipping, Shipping
    key :seller
    key :unit, Unit

    alias kosher? kosher
    alias new? new

    def <=>(other)
      if kosher? != other.kosher?
        kosher? ? -1 : 1
      else
        price <=> other.price
      end
    end

    def price
      unit.price + shipping.cost
    end
  end
end
