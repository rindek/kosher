module Kosher

  # An offer.
  #
  # This is an actual item offered on a particular venue by a seller.
  class Offer < Structure
    include Comparable

    key     :id
    key     :venue
    has_one :item
    has_one :seller
    has_one :shipping

    # Compares offer with another offer.
    #
    # A kosher offer is better than an unkosher offer. If both offers are
    # kosher or unkosher, a lower-priced offer is better.
    def <=>(other)
      if kosher? != other.kosher?
        kosher? ? -1 : 1
      else
        price <=> other.price
      end
    end

    # Returns whether the offer is kosher.
    #
    # An offer is kosher if its item, seller, and shipping are kosher.
    def kosher?
      item.kosher? && seller.kosher? && shipping.kosher?
    end

    # The total price of an offer.
    def price
      item.price + shipping.cost
    end
  end
end
