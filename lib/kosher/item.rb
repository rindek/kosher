require 'kosher/price'

module Kosher
  class Item
    include Price

    attribute :quantity, Integer, default: 1
  end
end
