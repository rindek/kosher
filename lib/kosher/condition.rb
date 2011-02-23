module Kosher
  class Condition < Struct.new(:in_words)
    def to_i
      case in_words
      when 'new'
        1
      when 'mint'
        2
      when 'verygood'
        3
      when 'good'
        4
      when 'acceptable'
        5
      else
        6
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
