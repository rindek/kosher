module Kosher
  module Price
    extend ActiveSupport::Concern

    included do
      key :cents,    Integer
      key :currency, String

      validates_presence_of     :currency
      validates_numericality_of :cents,
                                :greater_than => 0
    end

    def price
      Money.new(cents, currency)
    end
  end
end
