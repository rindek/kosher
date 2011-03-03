module Kosher
  class Condition < Struct.new(:in_words)
    def to_i
      case in_words
      when 'new' then 1
      when 'mint' then 2
      when 'verygood' then 3
      when 'good' then 4
      when 'acceptable' then 5
      else 6
      end
    end

    def kosher?
      to_i <= 4
    end

    def new?
      in_words == 'new'
    end

    def used?
      !new?
    end
  end
end
