module Kosher
  class Item < Struct.new(:condition, :description, :kosher, :price, :quantity)
    include Helpers
  end
end
