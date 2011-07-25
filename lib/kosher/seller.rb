module Kosher
  class Seller < Struct.new(:city, :country, :id, :kosher, :name, :rating)
    include Helpers
  end
end
