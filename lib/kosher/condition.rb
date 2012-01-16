module Kosher
  class Condition < Structure
    key :description
    key :grade
    key :kosher, default: false

    def kosher?
      Boolean(kosher)
    end

    def new?
      grade == 1
    end
  end
end
