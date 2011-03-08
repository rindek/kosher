module Kosher
  class Condition < Struct.new :grade
    def self.from_amazon(text)
      new case text
          when 'new'        then 1
          when 'mint'       then 2
          when 'verygood'   then 3
          when 'good'       then 4
          when 'acceptable' then 5
          else 6
          end
    end

    def kosher?
      grade <= Config.min_condition
    end

    def new?
      grade == 1
    end

    def used?
      !new?
    end
  end
end
