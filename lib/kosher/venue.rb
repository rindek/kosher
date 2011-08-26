module Kosher
  class Venue < Structure
    key :country
    key :name

    set_data_file File.expand_path("../../../data/venues.yml", __FILE__)
  end
end
