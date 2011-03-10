module Kosher
  class Offer < Struct.new(:id, :item, :seller, :shipping)
    include Comparable

    def <=>(other)
      if self.kosher? != other.kosher?
        self.kosher? ? -1 : 1
      else
        self.price.exchange_to(base_currency) <=> other.price.exchange_to(base_currency)
      end
    end

    def base_currency
      @base_currency ||= 'EUR'
    end

    def base_currency=(currency)
      @base_currency = currency
    end

    def kosher?
      item.kosher? && seller.kosher? && shipping.kosher?
    end

    def price
      item.price + shipping.cost
    end
  end
end
