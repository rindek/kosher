module Kosher
  class Condition
    def initialize(grade)
      @grade = grade
    end

    def kosher?
      @grade <= Config.min_condition
    end

    def new?
      @grade == 1
    end

    def used?
      !new?
    end
  end
end
