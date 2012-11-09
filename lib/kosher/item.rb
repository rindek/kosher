module Kosher
  class Item
    include Virtus

    attribute :condition,   Integer
    attribute :description, String
    attribute :price,       Price
    attribute :quantity,    Integer
  end
end
