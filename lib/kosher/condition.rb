module Kosher
  class Condition < Struct.new(:grade)
    include Threshold

    THRESHOLD = 4

    def kosher?
      grade <= threshold
    end

    def new?
      grade == 1
    end

    def used?
      !new?
    end
  end
end
