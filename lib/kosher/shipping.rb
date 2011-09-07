module Kosher
  class Shipping < Structure
    include Filter
    include Price

    key :available, Boolean

    validates_presence_of :available

    def available?
      validate!
      available
    end
  end
end
