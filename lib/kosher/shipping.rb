module Kosher
  class Shipping < Structure
    include Base
    include Price

    key :available, Boolean

    validates_presence_of :available
  end
end
