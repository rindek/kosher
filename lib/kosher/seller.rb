module Kosher
  class Seller < Structure
    include Filter

    key :id,     String
    key :name,   String
    key :rating, Float

    validates_presence_of :name
  end
end
