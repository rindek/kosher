require 'virtus'

module Kosher
  class Condition
    include Virtus

    attribute :grade, Integer

    def kosher?
      true
    end

    def new?
      grade == 1
    end

    def to_s
      case grade
      when 1
        'new'
      when 2
        'fine'
      when 3
        'very good'
      when 4
        'good'
      when 5
        'fair'
      end
    end
  end
end
