module Kosher
  class Condition < Structure
    include Filter

    key :grade, Integer
    key :description, String, ''

    validates_inclusion_of :grade, :in => 1..6

    def new?
      grade == 1
    end

    def used?
      grade != 1
    end
  end
end
