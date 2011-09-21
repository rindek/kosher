module Kosher
  class Offer < Structure
    include Comparable

    key :id
    key :condition, Condition
    key :seller,    Seller
    key :shipping,  Shipping
    key :unit,      Unit
    key :venue,     String

    def <=>(other)
      if kosher? != other.kosher?
        kosher? ? -1 : 1
      else
        price <=> other.price
      end
    end

    def kosher?
      [seller, shipping, condition].all?(&:kosher?)
    end

    def price
      unit.price + shipping.price
    end
  end
end
