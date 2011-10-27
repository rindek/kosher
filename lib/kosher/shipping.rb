module Kosher
  class Shipping < Structure
    key :cents, Integer
    key :currency

    def cost
      Money.new(cents, currency)
    end
  end
end
