module Kosher
  DAMAGED     = "missing|torn|broken|split|discard|withdrawn|rent|stain|school|damaged|water"
  EXLIBRARY   = "(?:e?x|discarded|retired|former|has|have)[\\s._-]*lib"
  MARKED      = "(highlight|hilit|underlin)"
  MISSING_VOL = "(vols?|volume) only"
  REVIEW_COPY = "\\b(?:uncorrected|advanced?\\sreview|arc)\\b"
end
