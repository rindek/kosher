module Kosher
  class Seller < Struct.new :id, :name, :average_rating
    def blacklisted?
      Config.blacklist.include?(id)
    end

    def kosher?
      return false if blacklisted?

      average_rating.to_f == 0.0 || average_rating >= Config.min_average_rating
    end
  end
end
