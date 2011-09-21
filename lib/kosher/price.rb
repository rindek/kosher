module Kosher
  module Price
    def self.included(base)
      base.key :cents,    Integer
      base.key :currency, String
    end

    def price
      Money.new(cents, currency)
    end
  end
end
