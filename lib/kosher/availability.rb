module Kosher
  class Availability < Struct.new(:hours, :preorder)
    include Threshold

    self.threshold = 48

    # Returns whether the availability is kosher.
    #
    # An availability is kosher if the item ships within a maximum threshold of
    # hours.
    #
    # If we do not know when an item will ship (e.g. Amazon's preorders), we
    # should set hours to nil, which will render the availability unkosher.
    def kosher?
      !hours.nil? && hours <= threshold
    end
  end
end
