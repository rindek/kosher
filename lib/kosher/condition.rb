module Kosher
  class Condition < Struct.new(:grade)
    def kosher?
      grade <= threshold
    end

    def new?
      grade == 1
    end

    def threshold
      @threshold ||= 4
    end

    def threshold=(grade)
      @threshold = grade
    end

    def used?
      !new?
    end
  end
end
