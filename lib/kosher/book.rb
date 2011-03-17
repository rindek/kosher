module Kosher
  class Book < Struct.new(:venue, :isbn, :asin, :sales_rank, :offers_total, :offers, :created_at)
    def best_kosher_offer
      offer = offers.sort.first

      (offer && offer.kosher?) ? offer : nil
    end
  end
end
