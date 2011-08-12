module Kosher
  class Venue < Structure
    include Static

    set_data_path File.expand_path("../../../data/venues.yml", __FILE__)

    # The name of the venue.
    key :name

    # The country the venue is based in.
    key :country
  end
end
