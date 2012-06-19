require 'ostruct'
require 'virtus'

require 'kosher/condition'
require 'kosher/description'
require 'kosher/item'
require 'kosher/seller'
require 'kosher/shipping'

module Kosher
  class Offer
    include Comparable
    include Virtus

    KOSHER_ATTRIBUTES = %w(condition description seller shipping)

    attribute :condition, Condition
    attribute :description, Description
    attribute :item, Item
    attribute :seller, Seller
    attribute :shipping, Shipping
    attribute :venue, OpenStruct, default: OpenStruct.new

    def <=>(other)
      if kosher? != other.kosher?
        kosher? ? -1 : 1
      else
        price <=> other.price
      end
    end

    def kosher?
      KOSHER_ATTRIBUTES.all? do |key|
        unless attribute = self[key]
          raise TypeError, "#{key} missing"
        end

        attribute.kosher?
      end
    end

    def price
      item.price + shipping.price
    end
  end
end
