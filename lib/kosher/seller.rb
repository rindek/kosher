module Kosher
  class Seller < Struct.new(:id, :name, :rating)
    def blacklisted?
      Config.blacklist.include?(id)
    end

    def kosher?
      !blacklisted? && (rating.to_f == 0.0 || rating >= Config.min_rating)
    end
  end
end
