module Kosher
  class Item < Struct.new(:cents, :currency, :quantity, :condition, :description)
    def kosher?
      condition.kosher? && description.kosher?
    end

    def price
      Money.new(cents, currency)
    end
  end
end
