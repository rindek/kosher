module Kosher

  # The actual item offered by a seller.
  #
  # An item has a price, quantity, condition, and description.
  class Item < Structure
    key     :cents, :type => Integer
    key     :currency
    key     :quantity, :type => Integer
    has_one :condition
    has_one :description

    def kosher?
      condition.kosher? && description.kosher?
    end

    def price
      raise TypeError, "Can't render money" unless cents
      Money.new(cents, currency)
    end
  end
end
