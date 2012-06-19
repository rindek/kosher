require 'money'
require 'virtus'

module Kosher
  module Price
    include Virtus

    attribute :cents, Integer
    attribute :currency, String

    def price
      unless cents
        raise TypeError, "missing cents in #{self.class}"
      end

      Money.new cents, currency
    end
  end
end
