module Kosher

  # The condition of a book.
  #
  # This condition is modeled on a numeric range starting from 1, which
  # represents `new' offers.
  class Condition < Structure
    include Threshold

    key :grade, :type => Integer

    # Returns whether the condition is kosher.
    #
    # A condition is kosher if its grade is below a minimum threshold. We
    # usually consider books that are good or better kosher.
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
