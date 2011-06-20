module Kosher

  # A price.
  class Price < Structure
    key :cents, :type => Integer
    key :currency

    def to_money
      raise TypeError, "Cannot render money" unless cents
      Money.new(cents, currency)
    end
  end
end
