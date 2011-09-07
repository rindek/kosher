module Kosher
  class Unit < Structure
    include Price

    key :quantity, Integer, 1
  end
end
