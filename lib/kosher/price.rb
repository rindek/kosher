module Kosher
  class Price < Struct.new(:cents, :currency)
    def to_money
      raise TypeError, "Cannot render money" unless cents
      Money.new(cents.to_i, currency)
    end
  end
end
