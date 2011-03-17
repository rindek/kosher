module Kosher
  class Book < Struct.new(:venue, :isbn, :asin, :sales_rank, :offers_count, :offers, :created_at)
    def best_kosher_offer
      offer = offers.sort.first

      offer.kosher? ? offer : nil
    end
  end
end
