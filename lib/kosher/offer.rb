module Kosher
  class Offer < Struct.new(:id, :item, :seller, :shipping)
    include Comparable

    BASE_CURRENCY = 'EUR'

    class << self
      def base_currency
        @base_currency ||= BASE_CURRENCY
      end

      def base_currency=(currency)
        @base_currency = currency
      end
    end

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
