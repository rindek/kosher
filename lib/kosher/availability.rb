module Kosher
  class Availability < Struct.new(:hours)
    include Threshold

    THRESHOLD = 48

    def kosher?
      hours <= threshold
    end
  end
end
