module Kosher
  class Offer < Struct.new(:id, :item, :seller, :shipping)

  # A used or new offer of a book by a dealer or store.
    include Comparable

    class << self

      # The base currency.
      attr_accessor :base_currency
    end

    self.base_currency = 'EUR'

    # Compares offer with another offer.
    #
    # A kosher offer is better than an unkosher offer. If both offers are
    # kosher or unkosher, a lower-priced offer is better.
    def <=>(other)
      if kosher? != other.kosher?
        kosher? ? -1 : 1
      else
        exchanged_price <=> other.exchanged_price
      end
    end

    # The price exchanged to the base currency.
    def exchanged_price
      price.exchange_to(base_currency)
    end

    # Returns whether the offer is kosher.
    def kosher?
      item.kosher? && seller.kosher? && shipping.kosher?
    end

    # The total price, including the shipping cost.
    def price
      item.price + shipping.cost
    end

    private

    def base_currency
      self.class.base_currency
    end
  end
end
