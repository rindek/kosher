module Kosher
  class Seller < Structure
    include Filter

    key :id
    key :name,   String
    key :rating, Float
  end
end
