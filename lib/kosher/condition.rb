module Kosher
  class Condition < Structure
    include Filter

    key :grade,       Integer
    key :description, String, ''

    def new?
      grade == 1
    end

    def used?
      grade != 1
    end
  end
end
