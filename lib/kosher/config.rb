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
      @max_hours_shipped = hours.to_i
    end

    def min_average_rating
      @min_average_rating ||= 4.8
    end

    def min_average_rating=(rating)
      @min_average_rating = rating
    end

    def min_condition
      @min_condition ||= 4
    end

    def min_condition=(grade)
      @min_condition = grade.to_i
    end
  end
end
