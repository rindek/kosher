module Kosher
  class Seller < Structure
    key :id
    key :kosher, Boolean, :default => true
    key :name
    key :rating, Float

    # Returns whether the item is kosher.
    def kosher?
      kosher
    end
  end
end
