module Kosher
  class Seller < Base
    key :id
    key :name
    key :rating, Float

    validates_presence_of :name
  end
end
