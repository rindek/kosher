module Kosher
  module Config
    extend self

    def base_currency
      @base_currency ||= 'EUR'
    end

    def base_currency=(code)
      @base_currency = code
    end

    def blacklist
      @blacklist ||= []
    end

    def blacklist=(seller_ids)
      @blacklist = seller_ids
    end

    def max_hours_shipped
      @max_hours_shipped ||= 48
    end

    def max_hours_shipped=(hours)
      @max_hours_shipped = hours
    end

    def min_rating
      @min_rating ||= 4.8
    end

    def min_rating=(rating)
      @min_rating = rating
    end

    def min_condition
      @min_condition ||= 4
    end

    def min_condition=(grade)
      @min_condition = grade
    end
  end
end
