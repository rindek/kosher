module Kosher
  class Shipping < Structure
    include Filter
    include Price

    key :available, Boolean

    alias_method :available?, :available
  end
end
