module Kosher
  class Book < Struct.new(:venue, :isbn, :asin, :offers_total, :offers)

    def best_kosher_offer
      offer = offers.sort.first

      (offer && offer.kosher?) ? offer : nil
    end
  end
end
