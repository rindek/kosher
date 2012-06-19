require 'virtus'

require 'kosher/seller/rating/amazon'

module Kosher
  class Seller
    class Rating
      include Virtus

      attribute :average, Float
      attribute :total, Integer

      def kosher?
        true
      end
    end
  end
end
