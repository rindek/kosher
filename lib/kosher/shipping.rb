module Kosher
  # Shipping details of an offer.
  #
  # Shipping costs something (or nothing) and is subject to availability.
  class Shipping < Structure
    key :cents, :type => Integer
    key :currency
    key :availability, :type => Structure

    # Returns whether the item ships for free.
    def free?
      cents == 0
    end

    # Returns true if the item is available to ship.
    def kosher?
      availability.kosher?
    end

    # The shipping cost.
    def cost
      raise TypeError, "Can't render money" unless cents
      Money.new(cents, currency)
    end
  end
end
