module Kosher
  class Seller < Struct.new(:id, :name, :rating, :location)
    include Threshold

    THRESHOLD = 4.8

    class << self
      def blacklist
        @blacklist ||= []
      end

      def blacklist=(ids)
        @blacklist = ids
      end
    end

    def blacklist
      self.class.blacklist
    end

    def blacklisted?
      blacklist.include?(id)
    end

    def kosher?
      !blacklisted? && (rating.to_f == 0.0 || rating >= threshold)
    end
  end
end
