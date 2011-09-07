module Kosher
  module Filter
    def self.included(base)
      base.key :kosher, Boolean, true
    end

    def kosher?
      validate!
      kosher
    end
  end
end
