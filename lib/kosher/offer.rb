module Kosher
  class Offer < Structure
    include Comparable

    key :id, String
    key :condition, Condition
    key :seller, Seller
    key :shipping, Shipping
    key :unit, Unit
    key :venue, String

    validates_presence_of :condition, :seller, :shipping, :unit, :venue

    def <=>(other)
      if kosher? != other.kosher?
        kosher? ? -1 : 1
      else
        price <=> other.price
      end
    end

    def kosher?
      validate!
      [seller, shipping, condition].all?(&:kosher?)
    end

    def price
      unit.price + shipping.price
    end
  end
end
