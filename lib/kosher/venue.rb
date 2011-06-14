module Kosher

  # A Venue.
  class Venue < Structure
    key :id, :type => Integer
    key :name
    key :locale
  end
end
