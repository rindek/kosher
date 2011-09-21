module Kosher
  module Filter
    def self.included(base)
      base.instance_eval do
        key :kosher, Boolean, true
        alias_method :kosher?, :kosher
      end
    end
  end
end
