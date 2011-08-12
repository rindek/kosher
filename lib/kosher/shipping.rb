module Kosher
  class Shipping < Structure
    include ActiveModel::Validations

    key :available
    key :cents,    Integer
    key :currency
    key :kosher,   Boolean, :default => true

    validates_presence_of     :currency, :available
    validates_numericality_of :cents,
                              :greater_than => 0

    # Shipping cost.
    def cost
      Money.new(cents, currency)
    end

    # Returns whether the item is kosher.
    def kosher?
      raise Invalid.new(self) unless valid?
      kosher
    end
  end
end
