module Kosher
  module Price
    def self.included(base)
      base.key :cents,    Integer
      base.key :currency, String

      base.validates_presence_of     :currency
      base.validates_numericality_of :cents, :greater_than => 0
    end

    def price
      Money.new(cents, currency)
    end
  end
end
