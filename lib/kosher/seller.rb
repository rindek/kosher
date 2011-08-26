module Kosher
  class Seller < Structure
    include Base

    key :id
    key :name
    key :rating, Float

    validates_presence_of :name
  end
end
