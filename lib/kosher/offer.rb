module Kosher
  class Offer < Struct.new(:id, :venue, :item, :seller, :shipping)
    include Comparable

    class << self
      def hooks
        @hooks ||= Array.new
      end

      def kosher_if(&block)
        @hooks << block
      end
    end

    def <=>(other)
      if kosher? != other.kosher?
        kosher? ? -1 : 1
      else
        price <=> other.price
      end
    end

    def kosher?
      item.kosher? && seller.kosher? && shipping.kosher? && otherwise_kosher?
    end

    def price
      item.price.to_money + shipping.cost.to_money
    end

    private

    def otherwise_kosher?
      Offer.hooks.all? { |hook| hook.call(self) }
    end
  end
end
