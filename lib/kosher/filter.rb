module Kosher
  module Filter
    def self.included(base)
      base.key :kosher, Boolean, :default => true
    end

    def kosher?
      validate!
      kosher
    end
  end
end
