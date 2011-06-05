module Kosher

  # The seller offering a book on a venue.
  #
  # A seller may have a location.
  class Seller < Structure
    include Threshold

    key     :id
    key     :name
    key     :rating, :type => Float
    has_one :location

    # Returns whether we blacklist the seller.
    def blacklisted?
      Kosher.seller_blacklist.include? id
    end

    # Returns whether the seller is kosher.
    #
    # A seller is kosher as long as he is not blacklisted and his rating is
    # unknown, 0.0, or above our minimum threshold.
    def kosher?
      !blacklisted? && (rating.to_f == 0.0 || rating >= threshold)
    end
  end
end
