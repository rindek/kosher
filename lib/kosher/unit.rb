module Kosher
  class Unit < Structure
    include Price

    key :quantity, Integer, :default => 1
  end
end
