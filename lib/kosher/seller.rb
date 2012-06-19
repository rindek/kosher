require 'virtus'

require 'kosher/seller/rating'

module Kosher
  class Seller
    include Virtus

    attribute :id, String
    attribute :name, String
    attribute :rating, Rating

    def kosher?
      rating.kosher?
    end
  end
end
