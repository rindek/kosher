module Kosher
  class Unit < Structure
    include ActiveModel::Validations

    key :cents,      Integer
    key :condition,  Integer
    key :currency
    key :description
    key :kosher,     Boolean, :default => true
    key :quantity,   Integer, :default => 1

    validates_inclusion_of    :condition, :in => 1..6
    validates_numericality_of :cents,
                              :greater_than => 0
    validates_presence_of     :currency

    # Returns whether the item is kosher.
    def kosher?
      raise Invalid.new(self) unless valid?
      kosher
    end

    # Item price.
    def price
      Money.new(cents, currency)
    end
  end
end
