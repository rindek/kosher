module Kosher
  class Dispatch
    include Virtus

    attribute :cost,     Price
    attribute :domestic, Boolean
    attribute :fast,     Boolean, default: false
    attribute :time,     Integer
  end
end
