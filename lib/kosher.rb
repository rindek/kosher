class Description < String
  def kosher?
    return true if self == ''

    return false if damaged?        ||
                    ex_library?     ||
                    marked?         ||
                    missing_volume? ||
                    review_copy?

    true
  end

  private

  def damaged?
    !!match(/missing|torn|broken|split|different|no cd|sticker|rent|stain|school|damaged|water/i)
  end

  def ex_library?
    !!match(/xlib|discarded|ex. l|exlib|x lib|x-lib|x_lib|retired lib|library discard|former lib|library withdrawn|withdrawn lib|withdrawn from lib|has lib|may have lib/i) &&
      !match(/not(\san?\s|\s)(e?x-?|e?x_|former )lib/i)
  end

  def marked?
    !!match(/(has|have|contains?|few|little|minor|some|considerable) (highl|hili|underl|writing|marginalia|marking|note)/i) ||
  end

  def missing_volume?
    !!match(/(vols?|volume) only/i)
  end

  def review_copy?
    !!match(/(?:^|\s)uncorrected|advanced? review|arc(?:$|\s)/i)
  end
end
