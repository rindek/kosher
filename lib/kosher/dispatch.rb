module Kosher
  class Dispatch
    include Virtus

    attribute :cost, Price
    attribute :fast, Boolean
    attribute :time, Integer
  end
end
