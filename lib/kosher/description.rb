module Kosher
  class Description < Struct.new(:text)
    DAMAGED     = "\\b(?:missing|torn|broken|split|discard|withdrawn|rent|stain|school|damaged|water)"
    EXLIB       = "(?:e?x|discarded|retired|former|has|have)[\\s._-]*lib"
    MARKED      = "(highlight|hilit|underlin)"
    MISSING_VOL = "(vols?|volume) only"
    REVIEW_COPY = "\\b(?:uncorrected|advanced?\\sreview|arc)\\b"

    def damaged?
      matches?(DAMAGED)
    end

    def ex_lib?
      matches?(EXLIB) && !matches?(negation_of(EXLIB))
    end

    def kosher?
      !(damaged? || ex_lib? || marked? || missing_volume? || review_copy?)
    end

    def marked?
      matches?(MARKED) && !matches?(negation_of(MARKED))
    end

    def missing_volume?
      matches?(MISSING_VOL)
    end

    def review_copy?
      matches?(REVIEW_COPY)
    end

    private

    def matches?(value)
      !!text.match(Regexp.new(value, true))
    end

    def negation_of(value)
      "(?:no|not an?)\\s+#{value}"
    end
  end
end
