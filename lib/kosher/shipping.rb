module Kosher
  class Shipping < Structure
    key :available, default: false
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
  end
end
