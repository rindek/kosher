require 'kosher/seller/rating'

module Kosher
  class Seller
    class Rating
      class Amazon < Rating
        def kosher?
          total.nil? || total < 50 && average > 4.4 || average > 4.7
        end
      end
    end
  end
end
