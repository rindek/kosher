module Kosher
  class Unit < Structure
    include Base
    include Price

    key :condition,   Integer
    key :description, String
    key :quantity,    Integer, :default => 1

    validates_inclusion_of :condition, :in => 1..6

    def new?
      condition == 1
    end

    def used?
      !new?
    end
  end
end
