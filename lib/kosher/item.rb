module Kosher
  class Item
    include Virtus

    attribute :condition,   Integer, default: 5
    attribute :description, String
    attribute :price,       Price
    attribute :quantity,    Integer, default: 1
  end
end
