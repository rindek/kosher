module Kosher
  class Seller < Struct.new(:id, :name, :rating, :location)
    def blacklist
      @blacklist ||= []
    end

    def blacklist=(ids)
      @blacklist = ids
    end

    def blacklisted?
      blacklist.include? id
    end

    def kosher?
      !blacklisted? && (rating.to_f == 0.0 || rating >= threshold)
    end

    def threshold
      @threshold ||= 4.8
    end

    def threshold=(rating)
      @threshold = rating
    end
  end
end
