module Kosher
  class Offer
    include Comparable
    include Virtus

    attribute :id,          String
    attribute :dispatch,    Dispatch
    attribute :item,        Item
    attribute :marketplace, String
    attribute :seller,      Seller
    attribute :uri,         String

    def <=>(other)
      price <=> other.price
    end

    def price
      item_price + dispatch_cost
    end

    def item_price
      Money.new item.price.amount, item.price.currency
    end

    def dispatch_cost
      Money.new dispatch.cost.amount, dispatch.cost.currency
    end
  end
end
