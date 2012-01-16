module Kosher
  class Offer < Structure
    include Comparable

    one :condition
    one :shipping
    one :seller
    one :unit
    one :venue

    def <=>(other)
      if kosher? != other.kosher?
        kosher? ? -1 : 1
      else
        price <=> other.price
      end
    end

    def kosher?
      condition.kosher? && seller.kosher? && shipping.kosher?
    end

    def price
      unit.price + shipping.cost
    end
  end
end
