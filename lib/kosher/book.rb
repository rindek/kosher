module Kosher

  # A book.
  #
  # A book is offered on many venues and has many offers through those venues.
  class Book < Structure
    key :isbn
    key :asin
    key :offers, :type => Array, :default => []

    # Returns the best kosher offer or nil if there are none.
    def best_kosher_offer
      offer = offers.sort.first
      offer && offer.kosher? ? offer : nil
    end
  end
end
