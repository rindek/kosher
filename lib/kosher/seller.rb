module Kosher
  class Seller < Structure
    key :location
    key :name
    key :kosher, default: false

    def kosher?
      Boolean(kosher)
    end
  end
end
