module Kosher
  class Detail < Structure
    include Filter

    key :condition,   Integer
    key :description, String, :default => ''

    validates_inclusion_of :condition, :in => 1..6

    def new?
      condition == 1
    end

    def used?
      !new?
    end
  end
end
