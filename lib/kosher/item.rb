module Kosher

  # The actual item offered by a seller.
  #
  # An item has a price, quantity, condition, and description.
  class Item < Structure
    key     :quantity, :type => Integer
    has_one :price
    has_one :condition
    has_one :description

    def kosher?
      condition.kosher? && description.kosher?
    end
  end
end
