module Kosher
  class Availability < Struct.new(:hours)
    include Threshold

    self.threshold = 48

    def kosher?
      hours <= threshold
    end
  end
end
