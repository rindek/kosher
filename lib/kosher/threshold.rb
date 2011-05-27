module Kosher
  module Threshold
    def self.included(klass)
      klass.extend(ClassMethods)
    end

    def threshold
      self.class.threshold
    end

    module ClassMethods
      attr_accessor :threshold
    end
  end
end
