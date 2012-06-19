module Kosher
  class Condition
    class Amazon < Condition
      def kosher?
        grade < 5
      end
    end
  end
end
