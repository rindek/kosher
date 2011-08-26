module Kosher
  class Shipping < Base
    include Price

    key :available, Boolean

    validates_presence_of :available
  end
end
