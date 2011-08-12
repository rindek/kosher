module Kosher
  class Offer < Structure
    include ActiveModel::Validations
    include Comparable

    key :id
    one :seller
    one :shipping
    one :unit
    key :venue_id, Integer

    validates_presence_of :seller, :shipping, :unit, :venue_id

    def <=>(other)
      if kosher? != other.kosher?
        kosher? ? -1 : 1
      else
        total <=> other.total
      end
    end

    def kosher?
      raise InvalidRecord.new(self) unless valid?
      seller.kosher? && shipping.kosher? && unit.kosher?
    end

    def price
      unit.price + shipping.cost
    end
  end
end
