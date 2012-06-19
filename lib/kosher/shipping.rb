require 'kosher/price'

module Kosher
  class Shipping
    include Price

    attribute :available, Boolean, default: true
    attribute :fast, Boolean, default: false

    def kosher?
      available?
    end
  end
end
