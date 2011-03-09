require 'money'

module Kosher
  class Offer < Struct.new(
    :id,
    :seller,
    :condition,
    :description,
    :hours_shipped,
    :price_in_cents,
    :shipping_in_cents,
    :currency,
    :url)

    include Comparable

    def <=>(another)
      if self.kosher? != another.kosher?
        self.kosher? ? 1 : -1
      else
        -(self.final_price.exchange_to(Config.base_currency) <=> another.final_price.exchange_to(Config.base_currency))
      end
    end

    def available?
      hours_shipped.to_i <= Config.max_hours_shipped
    end

    def final_price
      price + shipping
    end

    def kosher?
      condition.kosher? && seller.kosher? && description.kosher? && available?
    end

    def price
      Money.new(price_in_cents, currency)
    end

    def shipping
      Money.new(shipping_in_cents.to_i, currency)
    end
  end
end
