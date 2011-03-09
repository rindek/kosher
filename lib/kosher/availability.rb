module Kosher
  class Availability < Struct.new(:hours)
    def kosher?
      hours <= threshold
    end

    def threshold
      @threshold ||= 48
    end

    def threshold=(hours)
      @threshold = hours
    end
  end
end
