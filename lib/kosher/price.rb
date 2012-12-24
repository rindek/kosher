module Kosher
  class Price
    include Virtus

    attribute :amount,   Integer
    attribute :currency, String
  end
end
