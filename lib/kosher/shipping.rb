module Kosher
  # Shipping details of an offer.
  #
  # Shipping costs something (or nothing) and is subject to availability.
  class Shipping < Structure
    has_one :cost
    has_one :availability

    # Returns whether the item ships for free.
    def free?
      cost.cents == 0
    end

    # Returns true if the item is available to ship.
    def kosher?
      availability.kosher?
    end
  end
end
