module Kosher
  class Shipping < Structure
    include Filter
    include Price

    key :available, Boolean

    validates_presence_of :available

    alias available? available
  end
end
