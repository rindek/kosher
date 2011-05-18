module Kosher
  class Availability < Struct.new(:hours, :preorder)
    include Threshold

    self.threshold = 48

    def kosher?
      hours <= threshold && !preorder
    end
  end
end
