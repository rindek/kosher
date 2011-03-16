module Kosher
  module Threshold
    def self.included(klass)
      klass.extend(ClassMethods)
    end

    def threshold
      self.class.threshold
    end

    module ClassMethods
      def threshold
        @threshold ||= THRESHOLD
      end

      def threshold=(value)
        @threshold = value
      end
    end
  end
end
