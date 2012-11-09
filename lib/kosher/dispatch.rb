module Kosher
  class Dispatch
    include Virtus

    attribute :time, Integer
    attribute :cost, Price
  end
end
