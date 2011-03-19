module Kosher
  class Seller < Struct.new(:id, :name, :rating, :location)
    include Threshold

    class << self
      attr_accessor :blacklist
    end

    self.threshold = 4.8
    self.blacklist = []

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
