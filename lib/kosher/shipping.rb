module Kosher
  class Shipping < Struct.new(:cost, :kosher)
    include Helpers

    alias available? kosher?
  end
end
