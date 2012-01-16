module Kosher
  class Shipping < Structure
    key :available, default: true
    key :cents, Integer
    key :currency
    key :fast, default: false

    def available?
      Boolean(available)
    end

    def cost
      Money.new(cents, currency)
    end

    def fast?
      Boolean(fast)
    end

    alias kosher? available?
  end
end
