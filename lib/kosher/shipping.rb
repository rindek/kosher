module Kosher
  class Shipping < Struct.new(:cents, :currency, :availability)
    def free?
      cents.to_i == 0
    end

    def kosher?
      availability.kosher?
    end

    def cost
      Money.new(cents.to_i, currency)
    end
  end
end
