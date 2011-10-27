module Kosher
  class Unit < Structure
    key :cents, Integer
    key :currency, String

    def price
      Money.new(cents, currency)
    end
  end
end
