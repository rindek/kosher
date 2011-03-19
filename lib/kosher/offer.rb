module Kosher
  class Offer < Struct.new(:id, :item, :seller, :shipping)
    include Comparable

    class << self
      attr_accessor :base_currency
    end

    self.base_currency = 'EUR'

    def <=>(other)
      if self.kosher? != other.kosher?
        self.kosher? ? -1 : 1
      else
        self.price.exchange_to(base_currency) <=> other.price.exchange_to(base_currency)
      end
    end

    def base_currency
      self.class.base_currency
    end

    def kosher?
      item.kosher? && seller.kosher? && shipping.kosher?
    end

    def price
      item.price + shipping.cost
    end
  end
end
