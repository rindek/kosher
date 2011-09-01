module Kosher
  module Filter
    def self.included(base)
      base.key :kosher, Boolean, :default => true
    end

    def kosher?
      raise_error_if_invalid

      kosher
    end
  end
end
