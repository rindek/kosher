module Kosher
  class String < String
    def kosher?
      !(present? && (
        damaged?        ||
        ex_library?     ||
        marked?         ||
        missing_volume? ||
        review_copy?))
    end

    private

    def expect(str)
      !!match(Regexp.new(str, true))
    end

    def do_not_expect(str)
      !match(Regexp.new(str, true))
    end

    def damaged?
      expect(DAMAGED)
    end

    def ex_library?
      expect(EXLIBRARY) && do_not_expect(negation_of(EXLIBRARY))
    end

    def marked?
      expect(MARKED) && do_not_expect(negation_of(MARKED))
    end

    def missing_volume?
      expect(MISSING_VOL)
    end

    def negation_of(str)
      "(?:no|not an?)\\s+#{str}"
    end

    def present?
      self != ''
    end

    def review_copy?
      expect(REVIEW_COPY)
    end
  end
end
